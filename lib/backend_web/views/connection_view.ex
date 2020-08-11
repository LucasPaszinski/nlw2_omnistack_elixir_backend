defmodule BackendWeb.ConnectionView do
  use BackendWeb, :view
  alias BackendWeb.ConnectionView

  def render("index.json", %{connections: connections}) do
    render_many(connections, ConnectionView, "connection.json")
  end

  def render("show.json", %{connection: connection}) do
    render_one(connection, ConnectionView, "connection.json")
  end

  def render("connection.json", %{connection: connection}) do
    %{id: connection.id}
  end
end
