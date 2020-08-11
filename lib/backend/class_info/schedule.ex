defmodule Backend.ClassInfo.Schedule do
  use Ecto.Schema
  import Ecto.Changeset

  schema "schedules" do
    field :from, :integer
    field :to, :integer
    field :week_day, :integer
    belongs_to :class, Backend.ClassInfo.Class

    timestamps()
  end

  @doc false
  def changeset(schedule, attrs) do
    schedule
    |> cast(attrs, [:week_day, :from, :to, :class_id])
    |> validate_required([:week_day, :from, :to])
    |> assoc_constraint(:class)

  end
end
