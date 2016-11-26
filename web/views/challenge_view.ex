defmodule OpensourceChallenge.ChallengeView do
  use OpensourceChallenge.Web, :view

  attributes [
    :name,
    :shortname,
    :starts_on,
    :ends_on
  ]

  has_many :contributions,
    serializer: OpensourceChallenge.ContributionView,
    identifiers: :when_included,
    link: :contributions_link

  def contributions_link(challenge, conn) do
    challenge_contributions_url(conn, :index, challenge.id)
  end
end
