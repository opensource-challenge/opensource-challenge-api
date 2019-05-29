defmodule OpensourceChallenge.Contribution do
  use Ecto.Schema

  import Ecto.Changeset

  alias Ecto.Changeset
  alias OpensourceChallenge.Repo
  alias OpensourceChallenge.User
  alias OpensourceChallenge.Challenge

  schema "contributions" do
    field(:title, :string)
    field(:date, :date)
    field(:link, :string)
    field(:description, :string)
    belongs_to(:user, User)
    belongs_to(:challenge, Challenge)

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:user_id, :challenge_id, :title, :date, :link, :description])
    |> validate_required([:user_id, :challenge_id, :title, :date, :description])
    |> validate_challenge_not_closed
    |> validate_contribution_date
  end

  defp validate_contribution_date(changeset) do
    changeset
    |> validate_contribution_date_not_future
    |> validate_contribution_date_in_challenge
  end

  defp validate_challenge_not_closed(changeset) do
    challenge_id = Changeset.get_field(changeset, :challenge_id)

    changeset =
      if challenge_id do
        challenge = Repo.get!(Challenge, challenge_id)

        if challenge.closed do
          add_error(changeset, :challenge_id, "Cannot add contribution to closed challenge")
        else
          changeset
        end
      else
        changeset
      end

    changeset
  end

  defp validate_contribution_date_not_future(changeset) do
    date = Changeset.get_field(changeset, :date)

    if date do
      case Date.compare(date, Date.from_erl!(:erlang.date())) do
        :gt -> add_error(changeset, :date, "Date cannot be in the future")
        _ -> changeset
      end
    else
      changeset
    end
  end

  defp validate_contribution_date_in_challenge(changeset) do
    date = Changeset.get_field(changeset, :date)

    changeset =
      if date do
        challenge_id = Changeset.get_field(changeset, :challenge_id)
        challenge = Repo.get!(Challenge, challenge_id)

        if date > challenge.ends_on || date < challenge.starts_on do
          add_error(
            changeset,
            :date,
            "Date must be between " <>
              "#{Date.to_iso8601(challenge.starts_on)} and " <>
              "#{Date.to_iso8601(challenge.ends_on)}",
            starts_on: challenge.starts_on,
            ends_on: challenge.ends_on
          )
        else
          changeset
        end
      else
        changeset
      end

    changeset
  end
end
