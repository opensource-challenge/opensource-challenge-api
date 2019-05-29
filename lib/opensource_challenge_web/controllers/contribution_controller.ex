defmodule OpensourceChallengeWeb.ContributionController do
  use OpensourceChallengeWeb, :controller

  import Ecto.Query, only: [where: 2, preload: 2]

  alias OpensourceChallenge.Repo
  alias OpensourceChallenge.ChallengeService
  alias OpensourceChallenge.Contribution
  alias OpensourceChallenge.ContributionService

  plug(:scrub_params, "data" when action in [:create, :update])

  plug(:authorize_resource,
    model: Contribution,
    except: [:show, :index, :create]
  )

  plug(JaResource)

  def model, do: OpensourceChallenge.Contribution

  def handle_index(_conn, %{"include" => include}) do
    includes =
      include
      |> String.split(",")
      |> Enum.map(&String.to_atom/1)

    Contribution
    |> preload(^includes)
  end

  def handle_index(_conn, %{"challenge_id" => challenge_id}) do
    Contribution
    |> where(challenge_id: ^challenge_id)
  end

  def handle_index(_conn, %{"user_id" => user_id}) do
    Contribution
    |> where(user_id: ^user_id)
  end

  def handle_index(_conn, _params) do
    Contribution
  end

  def handle_create(%{assigns: %{current_user: user}}, attributes) do
    attributes = Map.put(attributes, "user_id", user.id)
    challenge = Repo.one!(ChallengeService.latest_challenge())
    attributes = Map.put(attributes, "challenge_id", challenge.id)
    ContributionService.create_contribution(attributes)
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
