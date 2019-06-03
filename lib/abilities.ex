alias OpensourceChallenge.User
alias OpensourceChallenge.Challenge
alias OpensourceChallenge.Contribution

defimpl Canada.Can, for: User do
  # Users can create contributions
  def can?(%User{}, :create, Contribution), do: true

  # Can update and delete own contributions
  def can?(%User{id: user_id}, action, %Contribution{user_id: user_id})
      when action in [:update, :delete],
      do: true

  # Admins can update and delete any contributions
  def can?(%User{admin: admin}, action, %Contribution{})
      when action in [:update, :delete],
      do: admin

  # Admins can update and delete any user
  def can?(%User{admin: admin}, action, %User{})
      when action in [:update, :delete],
      do: admin

  # Users can see any challenge
  def can?(%User{}, :index, Challenge), do: true
  def can?(%User{}, :show, %Challenge{}), do: true

  # Admins can do anything with challenges
  def can?(%User{admin: true}, :create, Challenge), do: true
  def can?(%User{admin: true}, _, %Challenge{}), do: true

  # Anything else is forbidden
  def can?(%User{}, _, _), do: false
end

defimpl Canada.Can, for: Any do
  def can?(_, _, _), do: false
end
