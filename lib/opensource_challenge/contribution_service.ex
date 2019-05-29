defmodule OpensourceChallenge.ContributionService do
  alias OpensourceChallenge.Contribution
  alias OpensourceChallengeWeb.ContributionView
  alias OpensourceChallenge.Repo
  alias OpensourceChallengeWeb.Endpoint

  def create_contribution(attributes) do
    %Contribution{}
    |> Contribution.changeset(attributes)
    |> Repo.insert()
    |> case do
      {:ok, contribution} -> sync_to_socket(contribution)
      other -> other
    end
  end

  defp sync_to_socket(contribution) do
    Endpoint.broadcast(
      "room:contributions",
      "new:contribution",
      ContributionView
      |> JaSerializer.format(contribution, Endpoint)
    )
    |> case do
      :ok -> {:ok, contribution}
      other -> other
    end
  end
end
