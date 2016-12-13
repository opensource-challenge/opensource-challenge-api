defmodule OpensourceChallenge.ContributionView do
  use OpensourceChallenge.Web, :view

  attributes [
    :title,
    :date,
    :link,
    :description,
    :inserted_at
  ]

  has_one :user,
    serializer: OpensourceChallenge.UserView,
    identifiers: :when_included,
    link: :user_link

  has_one :challenge,
    serializer: OpensourceChallenge.ChallengeView,
    identifiers: :when_included,
    link: :challenge_link

  def user_link(contribution, conn) do
    user_url(conn, :show, contribution.user_id)
  end

  def challenge_link(contribution, conn) do
    challenge_url(conn, :show, contribution.challenge_id)
  end
end
