defmodule OpensourceChallenge.AuthErrorHandler do
  use OpensourceChallenge.Web, :controller

  def unauthenticated(conn, params) do
    conn
    |> put_status(401)
    |> render(OpensourceChallenge.ErrorView, "401.json")
  end

  def unauthorized(conn, params) do
    conn
    |> put_status(403)
    |> render(OpensourceChallenge.ErrorView, "403.json")
  end
end
