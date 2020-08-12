defmodule Backend.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :avatar, :string, null: false
    field :bio, :string, null: false
    field :name, :string, null: false
    field :whatsapp, :bigint, null: false

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :avatar, :whatsapp, :bio])
    |> validate_required([:name, :avatar, :whatsapp, :bio])
  end
end
