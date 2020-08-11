defmodule Backend.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :avatar, :string
    field :bio, :string
    field :name, :string
    field :whatsapp, :integer

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :avatar, :whatsapp, :bio])
    |> validate_required([:name, :avatar, :whatsapp, :bio])
  end
end
