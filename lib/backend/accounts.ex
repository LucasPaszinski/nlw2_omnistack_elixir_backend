defmodule Backend.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Backend.Repo

  alias Backend.Accounts.User

  def create_user(attrs \\ %{}) do
    %{
      "name" => name,
      "avatar" => avatar,
      "whatsapp" => whatsapp,
      "bio" => bio
    } = attrs

    %User{}
    |> User.changeset(%{
      name: name,
      avatar: avatar,
      whatsapp: whatsapp,
      bio: bio
    })
    |> Repo.insert()
  end

  def get_user(id) do
    user = Repo.get(User, id)
    IO.inspect user
    user
  end
end
