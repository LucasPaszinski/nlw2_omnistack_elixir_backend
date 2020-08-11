defmodule BackendWeb.ClassController do
  use BackendWeb, :controller


  alias Backend.Accounts
  alias Backend.Accounts.User
  alias Backend.ClassInfo
  alias Backend.ClassInfo.Class
  alias Backend.ClassInfo.Schedule

  action_fallback BackendWeb.FallbackController

  def index(conn, params) do
    classes = ClassInfo.list_classes(params)
    render(conn, "index.json", classes: classes)
  end

  def create(conn, class_params) do


    {:ok, %User{} = user} = Accounts.create_user(class_params) 
    IO.puts "user id é #{ inspect user}"

    {:ok, %Class{} = class} = ClassInfo.create_class(class_params, user)

    %{"schedule" => schedules} = class_params

    IO.inspect schedules

    schedules_results = Enum.map(schedules,fn s ->
      {:ok, %Schedule{} = schedule_created } = ClassInfo.create_schedule(s, class)
      schedule_created
    end)

    conn
    |> put_status(:created)
    |> render("index.json", %{classes: schedules_results})
  end
end
