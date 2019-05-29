defmodule OpensourceChallengeWeb.ContributionView do
  use OpensourceChallengeWeb, :view

  attributes([
    :title,
    :date,
    :link,
    :description,
    :inserted_at
  ])

  has_one(:user,
    serializer: OpensourceChallengeWeb.UserView,
    identifiers: :when_included,
    link: :user_link
  )

  has_one(:challenge,
    serializer: OpensourceChallengeWeb.ChallengeView,
    identifiers: :when_included,
    link: :challenge_link
  )

  def user_link(contribution, conn) do
    Routes.user_url(conn, :show, contribution.user_id)
  end

  def challenge_link(contribution, conn) do
    Routes.challenge_url(conn, :show, contribution.challenge_id)
  end

  def challenge(struct, _conn) do
    case struct.challenge do
      %Ecto.Association.NotLoaded{} ->
        struct
        |> Ecto.assoc(:challenge)
        |> OpensourceChallenge.Repo.all()

      other ->
        other
    end
  end
end
