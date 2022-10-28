defmodule LiveviewWithAlpineWeb.PageController do
  use LiveviewWithAlpineWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
