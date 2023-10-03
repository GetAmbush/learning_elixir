defmodule ShortGhostWeb.UrlController do
  use ShortGhostWeb, :controller

  alias ShortGhost.Links
  alias ShortGhost.Links.Url

  action_fallback(ShortGhostWeb.FallbackController)

  def show(conn, params) do
    with {:ok, %Url{} = url} <- Links.fetch_url(params["short_url"]) do
      conn
      |> put_resp_header("Location", url.original_url)
      |> resp(301, "")
    end
  end

  def create(conn, params) do
    with {:ok, %Url{} = url} <- Links.create_url(params) do
      conn
      |> put_status(201)
      |> json(url)
    end
  end
end
