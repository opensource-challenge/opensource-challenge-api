defmodule OpensourceChallenge.ContributionController do
  use OpensourceChallenge.Web, :controller

  alias OpensourceChallenge.Contribution

  plug :scrub_params, "data" when action in [:create, :update]
  plug :authorize_resource, model: Contribution, except: [:show, :index]
  plug JaResource

  def handle_index(_conn, %{"include" => include}) do
    includes = include
               |> String.split(",")
               |> Enum.map(&String.to_atom/1)

    Contribution
    |> preload(^includes)
  end

  def handle_index(_conn, _params) do
    Contribution
  end

  def handle_create(%{assigns: %{current_user: user}}, attributes) do
    attributes = Map.put(attributes, "user_id", user.id)
    attributes = Map.put(attributes, "challenge_id", 2)
    Contribution.changeset(%Contribution{}, attributes)
  end

  def filter(_conn, query, "user_id", user_id) do
    where(query, user_id: ^user_id)
  end

  def filter(_conn, query, "challenge_id", challenge_id) do
    where(query, challenge_id: ^challenge_id)
  end

  def filter(_conn, query, "date", date) do
    where(query, date: ^date)
  end
end
