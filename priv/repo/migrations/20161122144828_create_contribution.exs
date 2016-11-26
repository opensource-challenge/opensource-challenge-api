defmodule OpensourceChallenge.Repo.Migrations.CreateContribution do
  use Ecto.Migration

  def change do
    create table(:contributions) do
      add :date, :date
      add :link, :string
      add :description, :text
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:contributions, [:user_id])

  end
end
