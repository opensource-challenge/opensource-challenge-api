defmodule OpensourceChallenge.UserController do
  use OpensourceChallenge.Web, :controller

  alias OpensourceChallenge.User

  #plug Guardian.Plug.EnsureAuthenticated,
  #  handler: OpensourceChallenge.AuthErrorHandler

  def index(conn, _params) do
    users = Repo.all(User)

    render(conn, "index.json-api", data: users)
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get!(User, id)

    render(conn, "show.json-api", data: user)
  end

  def current(conn, _) do
    user = conn
           |> Guardian.Plug.current_resource

    conn
    |> render(OpensourceChallenge.UserView, "show.json-api", user: user)
  end
end
