defmodule Backend.ClassInfoTest do
  use Backend.DataCase

  alias Backend.ClassInfo

  describe "classes" do
    alias Backend.ClassInfo.Class

    @valid_attrs %{cost: 42, subject: "some subject"}
    @invalid_attrs %{cost: nil, subject: nil}

    test "create_class/1 with valid data creates a class" do
      user = user_fixture()
      assert {:ok, %Class{} = class} = ClassInfo.create_class(@valid_attrs, user)
      assert class.cost == 42
      assert class.subject == "some subject"
    end

    test "create_class/1 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = ClassInfo.create_class(@invalid_attrs, user)
    end
  end

  describe "schedules" do
    alias Backend.ClassInfo.Schedule

    @valid_attrs %{from: 42, to: 42, week_day: 42}
    @invalid_attrs %{from: nil, to: nil, week_day: nil}

    test "create_schedule/1 with valid data creates a schedule" do
      user = user_fixture()
      class = class_fixture(user)
      assert {:ok, %Schedule{} = schedule} = ClassInfo.create_schedule(@valid_attrs, class)
      assert schedule.from == 42
      assert schedule.to == 42
      assert schedule.week_day == 42
    end

    test "create_schedule/1 with invalid data returns error changeset" do
      user = user_fixture()
      class = class_fixture(user)
      assert {:error, %Ecto.Changeset{}} = ClassInfo.create_schedule(@invalid_attrs, class)
    end
  end

  describe "connections" do
    alias Backend.ClassInfo.Connection

    test "create_connection/1 with valid data creates a connection" do
      user = user_fixture()
      assert {:ok, %Connection{} = connection} = ClassInfo.create_connection(%{user_id: user.id}, user)
    end

    test "create_connection/1 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = ClassInfo.create_connection(%{}, user)
      assert {:error, %Ecto.Changeset{}} = ClassInfo.create_connection(%{}, nil)
    end
  end

  test "list_teachers_classes/3 with valid matching parameters" do
    user = user_fixture()
    class = class_fixture(user)
    schedule = schedule_fixture(class)

    ClassInfo.list_teachers_classes(%{
      "subject" => "some subject",
      "week_day" => 42,
      "time" => "0:42"
    })
  end
end
