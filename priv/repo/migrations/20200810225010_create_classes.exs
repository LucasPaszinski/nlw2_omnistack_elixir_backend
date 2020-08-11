defmodule Backend.Repo.Migrations.CreateClasses do
  use Ecto.Migration

  def change do
    create table(:classes) do
      add :subject, :string
      add :cost, :integer
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create index(:classes, [:user_id])
  end
end
