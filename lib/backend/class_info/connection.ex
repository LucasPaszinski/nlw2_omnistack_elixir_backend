defmodule Backend.ClassInfo.Connection do
  use Ecto.Schema
  import Ecto.Changeset

  schema "connections" do
    belongs_to :user, Backend.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(connection, attrs) do
    connection
    |> cast(attrs, [:user_id])
    |> validate_required([])
    |> assoc_constraint(:user)
  end
end
