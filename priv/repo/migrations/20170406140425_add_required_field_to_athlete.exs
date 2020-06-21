defmodule RailsConf.Repo.Migrations.AddRequiredFieldToAthlete do
  use Ecto.Migration

  def change do
    alter table(:athletes) do
      add :email, :string, required: true
    end
  end
end
