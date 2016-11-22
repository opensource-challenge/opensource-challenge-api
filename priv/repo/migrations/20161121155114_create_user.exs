defmodule OpensourceChallenge.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :password_hash, :string
      add :website, :string
      add :picture, :string
      add :name, :string
      add :company, :string

      timestamps()
    end

    create index(:users, [:email], unique: true)

  end
end
