defmodule OpensourceChallenge.UserView do
  use OpensourceChallenge.Web, :view

  import Canada, only: [can?: 2]

  attributes [:website, :email, :picture, :name, :company, :admin]

  has_many :contributions, link: :contributions_link

  def email(user, %{assigns: %{current_user: current_user}}) when not is_nil(current_user) do
    if can?(current_user, update(user)) do
      user.email
    end
  end
  def email(_user, _conn), do: nil

  def admin(user, %{assigns: %{current_user: current_user}}) when not is_nil(current_user) do
    if can?(current_user, update(user)) do
      user.admin
    end
  end
  def admin(_user, _conn), do: nil

  def contributions_link(user, conn) do
    user_contributions_url(conn, :index, user.id)
  end
end
