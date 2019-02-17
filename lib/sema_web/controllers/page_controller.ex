defmodule SemaWeb.PageController do
  use SemaWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
