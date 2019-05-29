defmodule OpensourceChallengeWeb.UserController do
  use OpensourceChallengeWeb, :controller

  alias OpensourceChallenge.User

  plug(JaResource)

  def model, do: OpensourceChallenge.User

  def current(conn, _) do
    user =
      conn
      |> Guardian.Plug.current_resource()

    conn
    |> render(OpensourceChallengeWeb.UserView, "show.json-api", data: user)
  end

  def handle_update(_conn, user, attrs) do
    User.update_changeset(user, attrs)
  end

  def permitted_attributes(_conn, attrs, :update) do
    Map.take(attrs, ~w(email website picture name company admin))
  end
end
