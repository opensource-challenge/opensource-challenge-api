defmodule OpensourceChallenge.Contribution do
  use OpensourceChallenge.Web, :model

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
    |> cast(params, [:date, :link, :description])
    |> validate_required([:date, :description])
  end
end
