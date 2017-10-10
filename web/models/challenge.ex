defmodule OpensourceChallenge.Challenge do
  use OpensourceChallenge.Web, :model

  schema "challenges" do
    field :name, :string
    field :shortname, :string
    field :starts_on, Ecto.Date
    field :ends_on, Ecto.Date
    field :closed, :boolean
    has_many :contributions, OpensourceChallenge.Contribution

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :shortname, :starts_on, :ends_on, :closed])
    |> validate_required([:name, :shortname, :starts_on, :ends_on, :closed])
  end
end
