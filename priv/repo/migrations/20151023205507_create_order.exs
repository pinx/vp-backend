defmodule Backend.Repo.Migrations.CreateOrder do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :site_id, :string
      add :start_dt, :date
      add :end_dt, :date

      timestamps
    end

  end
end
