defmodule Backend.TestHelper do
  alias Backend.{
    Accounts,
    ClassInfo
  }

    def user_fixture(attrs \\ %{cost: 42, subject: "some subject"}) do
        {:ok, user} =
          attrs
          |> Accounts.create_user()
  
        user
    end

    def class_fixture(attrs \\ %{cost: 42, subject: "some subject"}, user) do
        {:ok, class} =
          attrs
          |> ClassInfo.create_class(user)
  
        class
      end
    
    def schedule_fixture(attrs \\ %{from: 42, to: 42, week_day: 42}, class) do
        {:ok, schedule} =
        attrs
        |> ClassInfo.create_schedule(class)
        
        schedule
    end

    def connection_fixture(attrs \\ %{}, user) do
        {:ok, connection} =
          attrs
          |> ClassInfo.create_connection(user)
  
        connection
      end
end