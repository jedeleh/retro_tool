defmodule RetroToolWeb.PageController do
  use RetroToolWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
