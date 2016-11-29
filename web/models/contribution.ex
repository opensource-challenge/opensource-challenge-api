defmodule OpensourceChallenge.Contribution do
  use OpensourceChallenge.Web, :model

  alias Ecto.Date
  alias Ecto.Changeset

  import Ecto.Query

  schema "contributions" do
    field :date, Ecto.Date
    field :link, :string
    field :description, :string
    belongs_to :user, OpensourceChallenge.User
    belongs_to :challenge, OpensourceChallenge.Challenge

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:user_id, :challenge_id, :date, :link, :description])
    |> validate_required([:user_id, :challenge_id, :date, :description])
    |> validate_contribution_date
  end

  defp validate_contribution_date(changeset) do
    date = Changeset.get_field(changeset, :date)

    if date > Date.from_erl(:erlang.date) do
      add_error(changeset, :date, "Date cannot be in the future")
    end

    if date > {2016, 12, 24} || date < {2016, 12, 1} do
      add_error(changeset, :date, "Date must be between 2016-12-01 and 2016-12-24")
    end

    changeset
  end
end
