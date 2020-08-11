defmodule Backend.ClassInfoTest do
  use Backend.DataCase

  alias Backend.ClassInfo

  describe "classes" do
    alias Backend.ClassInfo.Class

    @valid_attrs %{avatar: "some avatar", bio: "some bio", name: "some name", whatsapp: 42}
    @update_attrs %{avatar: "some updated avatar", bio: "some updated bio", name: "some updated name", whatsapp: 43}
    @invalid_attrs %{avatar: nil, bio: nil, name: nil, whatsapp: nil}

    def class_fixture(attrs \\ %{}) do
      {:ok, class} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ClassInfo.create_class()

      class
    end

    test "list_classes/0 returns all classes" do
      class = class_fixture()
      assert ClassInfo.list_classes() == [class]
    end

    test "get_class!/1 returns the class with given id" do
      class = class_fixture()
      assert ClassInfo.get_class!(class.id) == class
    end

    test "create_class/1 with valid data creates a class" do
      assert {:ok, %Class{} = class} = ClassInfo.create_class(@valid_attrs)
      assert class.avatar == "some avatar"
      assert class.bio == "some bio"
      assert class.name == "some name"
      assert class.whatsapp == 42
    end

    test "create_class/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ClassInfo.create_class(@invalid_attrs)
    end

    test "update_class/2 with valid data updates the class" do
      class = class_fixture()
      assert {:ok, %Class{} = class} = ClassInfo.update_class(class, @update_attrs)
      assert class.avatar == "some updated avatar"
      assert class.bio == "some updated bio"
      assert class.name == "some updated name"
      assert class.whatsapp == 43
    end

    test "update_class/2 with invalid data returns error changeset" do
      class = class_fixture()
      assert {:error, %Ecto.Changeset{}} = ClassInfo.update_class(class, @invalid_attrs)
      assert class == ClassInfo.get_class!(class.id)
    end

    test "delete_class/1 deletes the class" do
      class = class_fixture()
      assert {:ok, %Class{}} = ClassInfo.delete_class(class)
      assert_raise Ecto.NoResultsError, fn -> ClassInfo.get_class!(class.id) end
    end

    test "change_class/1 returns a class changeset" do
      class = class_fixture()
      assert %Ecto.Changeset{} = ClassInfo.change_class(class)
    end
  end

  describe "classes" do
    alias Backend.ClassInfo.Class

    @valid_attrs %{cost: 42, subject: "some subject"}
    @update_attrs %{cost: 43, subject: "some updated subject"}
    @invalid_attrs %{cost: nil, subject: nil}

    def class_fixture(attrs \\ %{}) do
      {:ok, class} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ClassInfo.create_class()

      class
    end

    test "list_classes/0 returns all classes" do
      class = class_fixture()
      assert ClassInfo.list_classes() == [class]
    end

    test "get_class!/1 returns the class with given id" do
      class = class_fixture()
      assert ClassInfo.get_class!(class.id) == class
    end

    test "create_class/1 with valid data creates a class" do
      assert {:ok, %Class{} = class} = ClassInfo.create_class(@valid_attrs)
      assert class.cost == 42
      assert class.subject == "some subject"
    end

    test "create_class/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ClassInfo.create_class(@invalid_attrs)
    end

    test "update_class/2 with valid data updates the class" do
      class = class_fixture()
      assert {:ok, %Class{} = class} = ClassInfo.update_class(class, @update_attrs)
      assert class.cost == 43
      assert class.subject == "some updated subject"
    end

    test "update_class/2 with invalid data returns error changeset" do
      class = class_fixture()
      assert {:error, %Ecto.Changeset{}} = ClassInfo.update_class(class, @invalid_attrs)
      assert class == ClassInfo.get_class!(class.id)
    end

    test "delete_class/1 deletes the class" do
      class = class_fixture()
      assert {:ok, %Class{}} = ClassInfo.delete_class(class)
      assert_raise Ecto.NoResultsError, fn -> ClassInfo.get_class!(class.id) end
    end

    test "change_class/1 returns a class changeset" do
      class = class_fixture()
      assert %Ecto.Changeset{} = ClassInfo.change_class(class)
    end
  end

  describe "schedules" do
    alias Backend.ClassInfo.Schedule

    @valid_attrs %{from: 42, to: 42, week_day: 42}
    @update_attrs %{from: 43, to: 43, week_day: 43}
    @invalid_attrs %{from: nil, to: nil, week_day: nil}

    def schedule_fixture(attrs \\ %{}) do
      {:ok, schedule} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ClassInfo.create_schedule()

      schedule
    end

    test "list_schedules/0 returns all schedules" do
      schedule = schedule_fixture()
      assert ClassInfo.list_schedules() == [schedule]
    end

    test "get_schedule!/1 returns the schedule with given id" do
      schedule = schedule_fixture()
      assert ClassInfo.get_schedule!(schedule.id) == schedule
    end

    test "create_schedule/1 with valid data creates a schedule" do
      assert {:ok, %Schedule{} = schedule} = ClassInfo.create_schedule(@valid_attrs)
      assert schedule.from == 42
      assert schedule.to == 42
      assert schedule.week_day == 42
    end

    test "create_schedule/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ClassInfo.create_schedule(@invalid_attrs)
    end

    test "update_schedule/2 with valid data updates the schedule" do
      schedule = schedule_fixture()
      assert {:ok, %Schedule{} = schedule} = ClassInfo.update_schedule(schedule, @update_attrs)
      assert schedule.from == 43
      assert schedule.to == 43
      assert schedule.week_day == 43
    end

    test "update_schedule/2 with invalid data returns error changeset" do
      schedule = schedule_fixture()
      assert {:error, %Ecto.Changeset{}} = ClassInfo.update_schedule(schedule, @invalid_attrs)
      assert schedule == ClassInfo.get_schedule!(schedule.id)
    end

    test "delete_schedule/1 deletes the schedule" do
      schedule = schedule_fixture()
      assert {:ok, %Schedule{}} = ClassInfo.delete_schedule(schedule)
      assert_raise Ecto.NoResultsError, fn -> ClassInfo.get_schedule!(schedule.id) end
    end

    test "change_schedule/1 returns a schedule changeset" do
      schedule = schedule_fixture()
      assert %Ecto.Changeset{} = ClassInfo.change_schedule(schedule)
    end
  end

  describe "connections" do
    alias Backend.ClassInfo.Connection

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def connection_fixture(attrs \\ %{}) do
      {:ok, connection} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ClassInfo.create_connection()

      connection
    end

    test "list_connections/0 returns all connections" do
      connection = connection_fixture()
      assert ClassInfo.list_connections() == [connection]
    end

    test "get_connection!/1 returns the connection with given id" do
      connection = connection_fixture()
      assert ClassInfo.get_connection!(connection.id) == connection
    end

    test "create_connection/1 with valid data creates a connection" do
      assert {:ok, %Connection{} = connection} = ClassInfo.create_connection(@valid_attrs)
    end

    test "create_connection/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ClassInfo.create_connection(@invalid_attrs)
    end

    test "update_connection/2 with valid data updates the connection" do
      connection = connection_fixture()
      assert {:ok, %Connection{} = connection} = ClassInfo.update_connection(connection, @update_attrs)
    end

    test "update_connection/2 with invalid data returns error changeset" do
      connection = connection_fixture()
      assert {:error, %Ecto.Changeset{}} = ClassInfo.update_connection(connection, @invalid_attrs)
      assert connection == ClassInfo.get_connection!(connection.id)
    end

    test "delete_connection/1 deletes the connection" do
      connection = connection_fixture()
      assert {:ok, %Connection{}} = ClassInfo.delete_connection(connection)
      assert_raise Ecto.NoResultsError, fn -> ClassInfo.get_connection!(connection.id) end
    end

    test "change_connection/1 returns a connection changeset" do
      connection = connection_fixture()
      assert %Ecto.Changeset{} = ClassInfo.change_connection(connection)
    end
  end
end
