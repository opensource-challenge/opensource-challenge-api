defmodule OpensourceChallenge.Challenge do
  use Ecto.Schema

  import Ecto.Changeset

  schema "challenges" do
    field(:name, :string)
    field(:shortname, :string)
    field(:starts_on, :date)
    field(:ends_on, :date)
    field(:closed, :boolean)
    has_many(:contributions, OpensourceChallenge.Contribution)

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :shortname, :starts_on, :ends_on, :closed])
    |> validate_required([:name, :shortname, :starts_on, :ends_on, :closed])
    |> validate_format(:shortname, ~r/[a-z\d\-]/)
  end
end
