defmodule Backend.Repo.Migrations.CreateResource do
  use Ecto.Migration

  def change do
    create table(:resources) do
      add :name, :string
      add :description, :string
      add :available_from, :datetime
      add :available_to, :datetime

      timestamps
    end

  end
end
