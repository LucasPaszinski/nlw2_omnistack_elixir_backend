defmodule Backend.AccountsTest do
  use Backend.DataCase, async: true

  alias Backend.Accounts

  describe "users" do
    alias Backend.Accounts.User

    @valid_attrs %{avatar: "some avatar", bio: "some bio", name: "some name", whatsapp: 42}
    @invalid_attrs %{avatar: nil, bio: nil, name: nil, whatsapp: nil}

    test "get_user/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user(user.id) == user
      assert Accounts.get_user(999) == nil
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.avatar == "some avatar"
      assert user.bio == "some bio"
      assert user.name == "some name"
      assert user.whatsapp == 42
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end
  end
end
