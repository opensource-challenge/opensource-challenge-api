defmodule OpensourceChallenge.UserView do
  use OpensourceChallenge.Web, :view

  attributes [:email, :website, :picture, :name, :company, :admin]

  has_many :contributions, link: :contributions_link

  def contributions_link(user, conn) do
    user_contributions_url(conn, :index, user.id)
  end
end
