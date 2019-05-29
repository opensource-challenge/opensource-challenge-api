defmodule OpensourceChallengeWeb.AuthErrorHandler do
  use OpensourceChallengeWeb, :controller

  @behaviour Guardian.Plug.ErrorHandler

  def unauthenticated(conn, _params \\ %{}) do
    conn
    |> put_status(401)
    |> render(OpensourceChallengeWeb.ErrorView, "401.json-api")
    |> halt
  end

  def unauthorized(conn, _params \\ %{}) do
    conn
    |> put_status(403)
    |> render(OpensourceChallengeWeb.ErrorView, "403.json-api")
    |> halt
  end

  @impl Guardian.Plug.ErrorHandler
  def auth_error(conn, {type, _reason}, _opts) do
    body = Jason.encode!(%{message: to_string(type)})
    send_resp(conn, 401, body)
  end
end
