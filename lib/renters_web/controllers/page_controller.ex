defmodule RentersWeb.PageController do
  use RentersWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
