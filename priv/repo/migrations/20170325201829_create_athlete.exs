defmodule RailsConf.Repo.Migrations.CreateAthlete do
  use Ecto.Migration

  def change do
    create table(:athletes) do
      add :name, :string
      add :position, :string

      timestamps()
    end

  end
end
