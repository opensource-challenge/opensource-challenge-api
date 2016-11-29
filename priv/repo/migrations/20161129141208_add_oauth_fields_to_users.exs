defmodule OpensourceChallenge.Repo.Migrations.AddOauthFieldsToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :github_login, :string
      add :google_login, :string
    end

    create index(:users, [:github_login], unique: true)
    create index(:users, [:google_login], unique: true)
  end
end
