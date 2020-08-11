defmodule Backend.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :avatar, :string
      add :whatsapp, :integer
      add :bio, :string

      timestamps()
    end

  end
end
