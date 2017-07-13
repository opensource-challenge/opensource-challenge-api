defmodule OpensourceChallenge.Contribution do
  use OpensourceChallenge.Web, :model

  alias Ecto.Date
  alias Ecto.Changeset
  alias OpensourceChallenge.Repo
  alias OpensourceChallenge.Challenge

  schema "contributions" do
    field :title, :string
    field :date, Date
    field :link, :string
    field :description, :string
    belongs_to :user, User
    belongs_to :challenge, Challenge

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:user_id, :challenge_id, :title, :date, :link, :description])
    |> validate_required([:user_id, :challenge_id, :title, :date, :description])
    |> validate_contribution_date
  end

  defp validate_contribution_date(changeset) do
    date = Changeset.get_field(changeset, :date)

    if date && Ecto.Date.compare(date, Date.from_erl(:erlang.date)) == :gt do
      changeset = add_error(changeset, :date,
                "Date cannot be in the future")
    end

    challenge_id = Changeset.get_field(changeset, :challenge_id)
    if challenge_id do
      challenge = Repo.get!(Challenge, challenge_id)

      if date > challenge.ends_on || date < challenge.starts_on do
        changeset = add_error(changeset, :date,
                  "Date must be between " <>
                  "#{Date.to_iso8601(challenge.starts_on)} and " <>
                  "#{Date.to_iso8601(challenge.ends_on)}",
                  starts_on: challenge.starts_on,
                  ends_on: challenge.ends_on)
      end
    end

    changeset
  end
end
