defmodule OpensourceChallenge.Repo.Migrations.AddContributionTitle do
  use Ecto.Migration

  def change do
    alter table(:contributions) do
      add :title, :string
    end
  end
end
