defmodule ShortGhostWeb.UrlController do
  use ShortGhostWeb, :controller

  alias ShortGhost.Links
  alias ShortGhost.Links.Url

  def show(conn, params) do
    {:ok, %Url{} = url} = Links.fetch_url(params["id"])

    conn
    |> put_resp_header("Location", url.original_url)
    |> resp(301, "")
  end

  def create(conn, params) do
    {:ok, %Url{}} = Links.create_url(params)

    resp(conn, 301, "created")
  end
end
