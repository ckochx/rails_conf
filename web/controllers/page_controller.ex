defmodule RailsConf.PageController do
  use RailsConf.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
