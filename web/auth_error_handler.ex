defmodule OpensourceChallenge.AuthErrorHandler do
  use OpensourceChallenge.Web, :controller

  def unauthenticated(conn, _params \\ %{}) do
    conn
    |> put_status(401)
    |> render(OpensourceChallenge.ErrorView, "401.json-api")
    |> halt
  end

  def unauthorized(conn, _params \\ %{}) do
    conn
    |> put_status(403)
    |> render(OpensourceChallenge.ErrorView, "403.json-api")
    |> halt
  end
end
