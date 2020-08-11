defmodule BackendWeb.ConnectionController do
  use BackendWeb, :controller

  alias Backend.ClassInfo
  alias Backend.ClassInfo.Connection

  action_fallback BackendWeb.FallbackController

  def index(conn, _params) do
    connections = ClassInfo.list_connections()
    render(conn, "index.json", connections: connections)
  end

  def create(conn, params) do
    
    %{"user_id" => user_id} = params
    user = Backend.Accounts.get_user(user_id) 
    IO.puts "user"
    IO.inspect user
    {:ok, %Connection{} = connection}  = ClassInfo.create_connection(params, user)
    
    conn
    |> put_status(:created)
    |> render("show.json", %{connection: connection})
  end
end
