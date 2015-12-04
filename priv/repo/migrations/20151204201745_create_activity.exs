defmodule Backend.Repo.Migrations.CreateActivity do
  use Ecto.Migration

  def change do
    create table(:activities) do
      add :name, :string
      add :description, :string
      add :start_at, :datetime
      add :end_at, :datetime

      timestamps
    end

  end
end
