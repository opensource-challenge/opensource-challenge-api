defmodule OpensourceChallenge.ContributionView do
  use OpensourceChallenge.Web, :view

  attributes [
    :date,
    :link,
    :description
  ]

  #has_one :user,
  #  serializer: OpensourceChallenge.UserSerializer,
  #  include: false,
  #  field: :user,
  #  links: [
  #    related: "/api/v1/user/:user_id",
  #    self: "/api/v1/contributions/:id/user"
  #  ]

  def user_id(struct, _conn) do
    struct.user_id
  end
end
