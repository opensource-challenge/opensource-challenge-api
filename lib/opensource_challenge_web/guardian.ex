defmodule OpensourceChallengeWeb.Guardian do
  use Guardian, otp_app: :opensource_challenge

  alias OpensourceChallenge.Repo
  alias OpensourceChallenge.User

  def subject_for_token(user = %User{}, _claims) do
    {:ok, "User:#{user.id}"}
  end

  def subject_for_token(_ressource, _claims) do
    {:error, "Unknown resource type"}
  end

  def resource_from_claims(%{"sub" => "User:" <> id}) do
    {:ok, Repo.get(User, id)}
  end

  def resource_from_claims(_claims) do
    {:error, "Unknown resource type"}
  end
end
