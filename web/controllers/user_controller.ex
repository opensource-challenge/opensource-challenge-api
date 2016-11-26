defmodule OpensourceChallenge.UserController do
  use OpensourceChallenge.Web, :controller

  plug JaResource

  #plug Guardian.Plug.EnsureAuthenticated,
  #  handler: OpensourceChallenge.AuthErrorHandler

  def current(conn, _) do
    user = conn
           |> Guardian.Plug.current_resource

    conn
    |> render(OpensourceChallenge.UserView, "show.json-api", user: user)
  end
end
