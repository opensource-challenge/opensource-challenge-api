defimpl Canada.Can, for: OpensourceChallenge.User do
  def can?(%OpensourceChallenge.User{id: user_id}, action, %OpensourceChallenge.Contribution{user_id: user_id})
    when action in [:update, :delete], do: true

  def can?(%OpensourceChallenge.User{ id: user_id }, _, _), do: false
end

defimpl Canada.Can, for: Atom do
end
