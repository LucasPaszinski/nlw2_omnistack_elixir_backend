defmodule BackendWeb.ConnectionController do
  use BackendWeb, :controller

  alias Backend.ClassInfo
  alias Backend.ClassInfo.Connection

  action_fallback BackendWeb.FallbackController

  def index(conn, _params) do
    connections = ClassInfo.total_connections()

    conn
    |> json(%{total_connections: connections})
  end

  def create(conn, params) do
    attrs = ClassInfo.get_connections_atom_map(params)
    user = Backend.Accounts.get_user(attrs.user_id)

    {:ok, %Connection{} = connection} = ClassInfo.create_connection(attrs, user)

    conn
    |> put_status(:created)
    |> json(%{})
  end
end
