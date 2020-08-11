defmodule Backend.Repo.Migrations.CreateConnections do
  use Ecto.Migration

  def change do
    create table(:connections) do
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create index(:connections, [:user_id])
  end
end
