alias OpensourceChallenge.User
alias OpensourceChallenge.Contribution

defimpl Canada.Can, for: User do
  def can?(%User{id: user_id}, action, %Contribution{user_id: user_id})
    when action in [:update, :delete], do: true

  def can?(%User{admin: admin}, action, _)
    when action in [:update, :delete], do: admin

  def can?(%User{ id: user_id }, _, _), do: false
end
