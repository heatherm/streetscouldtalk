defmodule StreetsCouldTalkWeb.PageController do
  use StreetsCouldTalkWeb, :controller

  def index(conn, _params) do
    conn
    |> render("index.html")
  end
end
