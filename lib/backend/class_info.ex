defmodule Backend.ClassInfo do
  @moduledoc """
  The ClassInfo context.
  """

  import Ecto.Query, warn: false

  alias Backend.Repo
  alias Backend.ClassInfo.Class
  alias Backend.ClassInfo.Schedule
  alias Backend.ClassInfo.Connection

  def list_teachers_classes(%{"week_day" => week_day, "subject" => subject, "time" => time}) do
    time = time |> convert_to_integer()

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
    %Class{}
    |> Class.changeset(attrs)
    |> Ecto.Changeset.put_assoc(:user, user)
    |> Repo.insert()
  end

  def create_schedule(attrs \\ %{}, class) do
    %Schedule{}
    |> Schedule.changeset(attrs)
    |> Ecto.Changeset.put_assoc(:class, class)
    |> Repo.insert()
  end

  def create_connection(attrs \\ %{}, user) do
    %Connection{}
    |> Connection.changeset(attrs)
    |> Ecto.Changeset.put_assoc(:user, user)
    |> Repo.insert()
  end

  def total_connections do
    Enum.count(Repo.all(Connection))
  end

  def get_class_atom_map(attrs) do
    %{
      "subject" => subject,
      "cost" => cost
    } = attrs

    %{
      subject: subject,
      cost: cost
    }
  end

  def get_schedule_atom_map(attrs) do
    %{
      "week_day" => week_day,
      "from" => from,
      "to" => to
    } = attrs

    %{
      week_day: week_day,
      from: convert_to_integer(from),
      to: convert_to_integer(to)
    }
  end

  def convert_to_integer(time) do
    [hour, minutes] = String.split(time, ":")
    String.to_integer(hour) * 60 + String.to_integer(minutes)
  end

  def get_connections_atom_map(attrs) do
    %{"user_id" => user_id} = attrs
    %{user_id: user_id}
  end
end
