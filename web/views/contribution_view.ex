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

  def user_link(contribution, conn) do
    user_url(conn, :show, contribution.user_id)
  end
end
