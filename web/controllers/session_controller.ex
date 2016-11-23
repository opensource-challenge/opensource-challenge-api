defmodule OpensourceChallenge.SessionController do
  use OpensourceChallenge.Web, :controller

  import Ecto.Query, only: [where: 2]
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
          Logger.warning "User #{username} just failed to login"
          conn
          |> put_status(401)
          |> render(OpensourceChallenge.ErrorView, "401.json")
      end
    rescue
      e ->
        IO.inspect e
        Logger.error "Unexpected error while attempting to login user #{username}"
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
      user = OAuth2.Client.get!(client, "/user").body
      user = User
             |> where(email: ^user["email"])
             |> Repo.one

      if !user do
        dummy_pass = random_pass
        user = Repo.insert! User.changeset(%User{}, %{
          name: user["name"] || user["login"],
          email: user["email"],
          password: dummy_pass,
          password_confirmation: dummy_pass,
          company: user["company"],
          picture: user["avatar_url"]
        })
      end

      Logger.info "User #{user.email} just logged in"

      {:ok, jwt, _} = Guardian.encode_and_sign(user, :token)
      conn
      |> json(%{access_token: jwt})
    rescue
      e ->
        IO.inspect e
        Logger.error "Unexpected error while attempting to login with gitub login"
        conn
        |> put_status(401)
        |> render(OpensourceChallenge.ErrorView, "401.json")
    end
  end

  def create(_conn, %{"grant_type" => grant_type}) do
    throw "Unsupported grant_type #{grant_type}"
  end

  defp random_pass() do
    :crypto.strong_rand_bytes(255) |> Base.url_encode64 |> binary_part(0, 255)
  end
end
