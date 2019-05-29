alias OpensourceChallenge.User
alias OpensourceChallenge.Contribution

defimpl Canada.Can, for: User do
  # Can update and delete own contributions
  def can?(%User{id: user_id}, action, %Contribution{user_id: user_id})
      when action in [:update, :delete],
      do: true

  # Admins can update and delete any contributions
  def can?(%User{admin: admin}, action, _)
      when action in [:update, :delete],
      do: admin

  # Anything else is forbidden
  def can?(%User{}, _, _), do: false
end

defimpl Canada.Can, for: Any do
  def can?(_, _, _), do: false
end
