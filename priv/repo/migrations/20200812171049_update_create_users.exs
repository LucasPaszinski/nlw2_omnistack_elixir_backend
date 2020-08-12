defmodule Backend.Repo.Migrations.UpdateCreateUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      modify :whatsapp, :bigint
    end
  end
end
