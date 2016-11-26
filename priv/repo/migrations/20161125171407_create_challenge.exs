defmodule OpensourceChallenge.Repo.Migrations.CreateChallenge do
  use Ecto.Migration

  def change do
    create table(:challenges) do
      add :name, :string
      add :shortname, :string
      add :starts_on, :date
      add :ends_on, :date

      timestamps()
    end
    create index(:challenges, [:name], unique: true)
    create index(:challenges, [:shortname], unique: true)

    alter table(:contributions) do
      add :challenge_id, references(:challenges, on_delete: :nothing)
    end
    create index(:contributions, [:challenge_id])

  end
end
