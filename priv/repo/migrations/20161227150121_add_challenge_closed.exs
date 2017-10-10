defmodule OpensourceChallenge.Repo.Migrations.AddChallengeClosed do
  use Ecto.Migration

  def change do
    alter table(:challenges) do
      add :closed, :boolean, default: true
    end
  end
end
