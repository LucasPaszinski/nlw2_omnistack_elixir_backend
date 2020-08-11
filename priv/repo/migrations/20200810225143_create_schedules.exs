defmodule Backend.Repo.Migrations.CreateSchedules do
  use Ecto.Migration

  def change do
    create table(:schedules) do
      add :week_day, :integer
      add :from, :integer
      add :to, :integer
      add :class_id, references(:classes, on_delete: :delete_all)

      timestamps()
    end

    create index(:schedules, [:class_id])
  end
end
