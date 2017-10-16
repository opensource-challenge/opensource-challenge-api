defmodule OpensourceChallenge.User do
  use OpensourceChallenge.Web, :model

  schema "users" do
    field :email, :string
    field :github_login, :string
    field :google_login, :string
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
  def update_changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [
      :email,
      :website,
      :picture,
      :name,
      :company,
      :admin
    ])
    |> validate_email
  end

  def from_github_changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [
      :email,
      :github_login,
      :website,
      :picture,
      :name,
      :company,
      :admin
    ])
    |> validate_email
  end

  def create_changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [
      :email,
      :github_login,
      :google_login,
      :password,
      :password_confirmation,
      :website,
      :picture,
      :name,
      :company,
      :admin
    ])
    |> validate_required([:password, :password_confirmation, :name])
    |> validate_email
    |> validate_length(:password, min: 8)
    |> validate_confirmation(:password)
    |> hash_password
  end

  defp validate_email(changeset) do
    changeset
    |> validate_required([:email])
    |> validate_format(:email, ~r/@/)
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
