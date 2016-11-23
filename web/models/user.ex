defmodule OpensourceChallenge.User do
  use OpensourceChallenge.Web, :model

  schema "users" do
    field :email, :string
    field :password_hash, :string
    field :website, :string
    field :picture, :string
    field :name, :string
    field :company, :string
    field :admin, :boolean

    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :password, :password_confirmation, :website, :picture, :name, :company, :admin])
    |> validate_required([:email, :password, :password_confirmation, :name])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 8)
    |> validate_confirmation(:password)
    |> hash_password
    |> unique_constraint(:email)
  end

  defp hash_password(%{valid?: false} = changeset), do: changeset
  defp hash_password(%{valid?: true} = changeset) do
    hashed_pw = Comeonin.Bcrypt.hashpwsalt(
      Ecto.Changeset.get_field(changeset, :password)
    )

    Ecto.Changeset.put_change(changeset, :password_hash, hashed_pw)
  end
end
