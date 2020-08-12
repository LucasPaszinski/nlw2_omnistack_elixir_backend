defmodule Backend.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Backend.Repo

  alias Backend.Accounts.User

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def get_user(id) do
    Repo.get(User, id)
  end

  def get_user_atom_map(attrs) do
    %{
      "name" => name,
      "avatar" => avatar,
      "whatsapp" => whatsapp,
      "bio" => bio
    } = attrs

    %{
      name: name,
      avatar: avatar,
      whatsapp: whatsapp,
      bio: bio
    }
  end
end
