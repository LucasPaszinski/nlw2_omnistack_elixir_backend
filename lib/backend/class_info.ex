defmodule Backend.ClassInfo do
  @moduledoc """
  The ClassInfo context.
  """

  import Ecto.Query, warn: false

  alias Backend.Repo
  alias Backend.ClassInfo.Class
  alias Backend.ClassInfo.Schedule
  alias Backend.ClassInfo.Connection

  def list_classes(%{
        "week_day" => week_day,
        "subject" => subject,
        "time" => time
      }) do
    time = time |> convert_to_integer()

    results =
      Repo.all(
        from s in Schedule,
          join: c in assoc(s, :class),
          join: u in assoc(c, :user),
          where:
            c.subject == ^subject and
              s.week_day == ^week_day and
              s.from <= ^time and
              s.to > ^time,
          preload: [class: {c, user: u}]
      )
  end

  def create_class(attrs \\ %{}, user) do
    %{
      "subject" => subject,
      "cost" => cost
    } = attrs

    %Class{}
    |> Class.changeset(%{
      subject: subject,
      cost: cost
    })
    |> Ecto.Changeset.put_assoc(:user, user)
    |> Repo.insert()
  end

  def convert_to_integer(time) do
    [hour, minutes] = String.split(time, ":")
    String.to_integer(hour) * 60 + String.to_integer(minutes)
  end

  def create_schedule(attrs \\ %{}, class) do
    %{
      "week_day" => week_day,
      "from" => from,
      "to" => to
    } = attrs

    %Schedule{}
    |> Schedule.changeset(%{
      week_day: week_day,
      from: convert_to_integer(from),
      to: convert_to_integer(to)
    })
    |> Ecto.Changeset.put_assoc(:class, class)
    |> Repo.insert()
  end

  def list_connections do
    Repo.all(Connection)
  end

  def create_connection(attrs \\ %{}, user) do
    %{"user_id" => user_id} = attrs
    
    %Connection{}
    |> Connection.changeset(%{user_id: user_id})
    |> Ecto.Changeset.put_assoc(:user, user )
    |> Repo.insert()
  end
end
