defmodule BackendWeb.ClassController do
  use BackendWeb, :controller

  alias Backend.Accounts
  alias Backend.Accounts.User
  alias Backend.ClassInfo
  alias Backend.ClassInfo.Class
  alias Backend.ClassInfo.Schedule

  action_fallback BackendWeb.FallbackController

  def index(conn, params) do
    schedules = ClassInfo.list_teachers_classes(params)

    json(
      conn,
      Enum.map(
        schedules,
        fn schedule ->
          %{
            # schedule
            week_day: schedule.week_day,
            from: schedule.from,
            to: schedule.to,
            # class
            subject: schedule.class.subject,
            cost: schedule.class.cost,
            # user
            avatar: schedule.class.user.avatar,
            bio: schedule.class.user.bio,
            name: schedule.class.user.name,
            whatsapp: schedule.class.user.whatsapp
          }
        end
      )
    )
  end

  def create(conn, class_params) do
    {:ok, %User{} = user} =
      class_params
      |> Accounts.get_user_atom_map()
      |> Accounts.create_user()

    {:ok, %Class{} = class} =
      class_params
      |> ClassInfo.get_class_atom_map()
      |> ClassInfo.create_class(user)

    Enum.map(
      class_params["schedule"],
      fn s ->
        {:ok, %Schedule{}} =
          s
          |> ClassInfo.get_schedule_atom_map()
          |> ClassInfo.create_schedule(class)
      end
    )

    conn
    |> put_status(:created)
    |> json(%{})
  end
end
