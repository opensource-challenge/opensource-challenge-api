defmodule OpensourceChallengeWeb.SessionController do
  use OpensourceChallengeWeb, :controller

  import Bcrypt, only: [verify_pass: 2]
  import Logger

  alias OpensourceChallenge.Repo
  alias OpensourceChallenge.User

  def create(conn, %{
        "grant_type" => "password",
        "username" => username,
        "password" => password
      }) do
    try do
      user = Repo.get_by!(User, email: username)

      if verify_pass(password, user.password_hash) do
        Logger.info("User #{username} just logged in")

        {:ok, jwt, _} = OpensourceChallengeWeb.Guardian.encode_and_sign(user)

        conn
        |> json(%{access_token: jwt})
      else
        Logger.warn("User #{username} just failed to login")

        conn
        |> put_status(401)
        |> render(OpensourceChallengeWeb.ErrorView, "401.json")
      end
    rescue
      e ->
        IO.inspect(e)
        Logger.error("Unexpected error while attempting to login #{username}")

        conn
        |> put_status(401)
        |> render(OpensourceChallengeWeb.ErrorView, "401.json")
    end
  end

  def create(conn, %{
        "grant_type" => "github",
        "authorizationCode" => authorization_code
      }) do
    try do
      client = Github.OAuth2.get_token!(code: authorization_code)
      github_user = OAuth2.Client.get!(client, "/user").body

      user =
        case Repo.get_by(User, github_login: github_user["login"]) do
          nil  ->
            email =
              case github_user["email"] do
                nil ->
                  OAuth2.Client.get!(client, "/user/emails").body
                  |> Enum.find(fn email -> email["primary"] end)
                  |> Map.fetch!("email")

                email ->
                  email
              end

            Repo.insert!(
              User.from_github_changeset(%User{}, %{
                    name: github_user["name"] || github_user["login"],
                    github_login: github_user["login"],
                    email: email,
                    company: github_user["company"],
                    picture: github_user["avatar_url"],
                    website: github_user["blog"] || github_user["html_url"]
                                         })
            )

            user = Repo.get_by(User, github_login: github_user["login"])
            Logger.info("User #{user.email} just created")
            user

          user ->
            user
        end

      Logger.info("User #{user.email} just logged in")

      {:ok, jwt, _} = OpensourceChallengeWeb.Guardian.encode_and_sign(user)

      conn
      |> json(%{access_token: jwt})
    rescue
      e ->
        IO.inspect(e)
        Logger.error("Unexpected error while attempting to login with github")

        conn
        |> put_status(401)
        |> render(OpensourceChallengeWeb.ErrorView, "401.json")
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
  #       |> render(OpensourceChallengeWeb.ErrorView, "401.json")
  #   end
  # end

  def create(_conn, %{"grant_type" => grant_type}) do
    throw("Unsupported grant_type #{grant_type}")
  end
end
