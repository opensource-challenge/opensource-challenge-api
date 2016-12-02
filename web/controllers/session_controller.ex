defmodule OpensourceChallenge.SessionController do
  use OpensourceChallenge.Web, :controller

  import Ecto.Query, only: [where: 2, where: 3]
  import Comeonin.Bcrypt
  import Logger

  alias OpensourceChallenge.User

  def create(conn, %{
        "grant_type" => "password",
        "username" => username,
        "password" => password
      }) do
    try do
      user = User
             |> where(email: ^username)
             |> Repo.one!
      cond do
        checkpw(password, user.password_hash) ->
          Logger.info "User #{username} just logged in"

          {:ok, jwt, _} = Guardian.encode_and_sign(user, :token)
          conn
          |> json(%{access_token: jwt})
        true ->
          Logger.warn "User #{username} just failed to login"
          conn
          |> put_status(401)
          |> render(OpensourceChallenge.ErrorView, "401.json")
      end
    rescue
      e ->
        IO.inspect e
        Logger.error "Unexpected error while attempting to login #{username}"
        conn
        |> put_status(401)
        |> render(OpensourceChallenge.ErrorView, "401.json")
    end
  end

  def create(conn, %{
        "grant_type" => "github",
        "authorizationCode" => authorization_code,
      }) do
    try do
      client = Github.OAuth2.get_token!(code: authorization_code)
      github_user = OAuth2.Client.get!(client, "/user").body
      user = User
             |> where(github_login: ^github_user["login"])
             |> Repo.one

      unless user do
        email =
          case github_user["email"] do
            nil -> OAuth2.Client.get!(client, "/user/emails").body
                   |> Enum.find(fn(email) -> email["primary"] end)
                   |> Map.fetch!("email")
            email -> email
          end

        dummy_pass = random_pass
        user = Repo.insert! User.changeset(%User{}, %{
          name: github_user["name"] || github_user["login"],
          github_login: github_user["login"],
          email: email,
          password: dummy_pass,
          password_confirmation: dummy_pass,
          company: github_user["company"],
          picture: github_user["avatar_url"],
          website: github_user["blog"] || github_user["html_url"]
        })
      end

      Logger.info "User #{user.email} just logged in"

      {:ok, jwt, _} = Guardian.encode_and_sign(user, :token)
      conn
      |> json(%{access_token: jwt})
    rescue
      e ->
        IO.inspect e
        Logger.error "Unexpected error while attempting to login with github"
        conn
        |> put_status(401)
        |> render(OpensourceChallenge.ErrorView, "401.json")
    end
  end

  # def create(conn, %{
  #       "grant_type" => "google",
  #       "authorizationCode" => authorization_code,
  #     }) do
  #   try do
  #     client = Google.OAuth2.get_token!(code: authorization_code)
  #     google_user = OAuth2.Client.get!(client, "/plus/v1/people/me").body
  #     emails = Enum.map(google_user["emails"],
  #                       fn(email) -> email["value"] end)
  #     user = User
  #            |> where([u], u.email in ^emails)
  #            |> Repo.one

  #     if !user do
  #       dummy_pass = random_pass
  #       user = Repo.insert! User.changeset(%User{}, %{
  #         name: google_user["displayName"] ||
  #           google_user["nickname"] ||
  #           google_user["name"]["formatted"],
  #         google_login: google_user["id"],
  #         email: List.first(emails),
  #         password: dummy_pass,
  #         password_confirmation: dummy_pass,
  #         company: List.first(google_user["organizations"])["name"],
  #         picture: google_user["image"]["url"]
  #                  |> String.replace_suffix("sz=50", "sz=400")
  #       })
  #     end

  #     Logger.info "User #{user.email} just logged in"

  #     {:ok, jwt, _} = Guardian.encode_and_sign(user, :token)
  #     conn
  #     |> json(%{access_token: jwt})
  #   rescue
  #     e ->
  #       IO.inspect e
  #       Logger.error "Unexpected error while attempting to login with google"
  #       conn
  #       |> put_status(401)
  #       |> render(OpensourceChallenge.ErrorView, "401.json")
  #   end
  # end

  def create(_conn, %{"grant_type" => grant_type}) do
    throw "Unsupported grant_type #{grant_type}"
  end

  defp random_pass do
    255
    |> :crypto.strong_rand_bytes
    |> Base.url_encode64
    |> binary_part(0, 255)
  end
end
