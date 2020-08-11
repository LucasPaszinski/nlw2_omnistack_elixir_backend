defmodule BackendWeb.ClassView do
  use BackendWeb, :view
  alias BackendWeb.ClassView

  def render("index.json", %{classes: classes}) do
    render_many(classes, ClassView, "class.json")
  end

  def render("show.json", %{class: class}) do
    render_one(class, ClassView, "class.json")
  end

  def render("class.json", %{class: result}) do
    %{
      class: class,
      from: from,
      to: to,
      week_day: week_day
    } = result

    %{
      subject: subject,
      cost: cost,
      user: user
    } = class

    %{
      avatar: avatar,
      bio: bio,
      name: name,
      whatsapp: whatsapp
    } = user

    %{
      week_day: week_day,
      from: from,
      to: to,
      subject: subject,
      cost: cost,
      avatar: avatar,
      bio: bio,
      name: name,
      whatsapp: whatsapp
    }
  end
end
