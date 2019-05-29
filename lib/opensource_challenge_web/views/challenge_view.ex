defmodule OpensourceChallengeWeb.ChallengeView do
  use OpensourceChallengeWeb, :view

  attributes([
    :name,
    :shortname,
    :starts_on,
    :ends_on,
    :closed
  ])

  has_many(:contributions,
    serializer: OpensourceChallengeWeb.ContributionView,
    identifiers: :when_included,
    link: :contributions_link
  )

  def contributions_link(challenge, conn) do
    challenge_contributions_url(conn, :index, challenge.id)
  end

  def contributions(struct, _conn) do
    case struct.contributions do
      %Ecto.Association.NotLoaded{} ->
        struct
        |> Ecto.assoc(:contributions)
        |> OpensourceChallenge.Repo.all()

      other ->
        other
    end
  end
end
