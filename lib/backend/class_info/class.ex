defmodule Backend.ClassInfo.Class do
  use Ecto.Schema
  import Ecto.Changeset

  schema "classes" do
    field :cost, :integer
    field :subject, :string
    belongs_to :user, Backend.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(class, attrs) do
    class
    |> cast(attrs, [:subject, :cost, :user_id])
    |> validate_required([:subject, :cost])
    |> assoc_constraint(:user)
  end
end
