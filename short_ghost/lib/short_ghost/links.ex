defmodule ShortGhost.Links do
  alias ShortGhost.Repo

  alias ShortGhost.Links.Url

  def fetch_url(id) do
    Url
    |> Repo.get(id)
    |> case do
      nil -> {:error, :url_does_not_exist}
      %Url{} = url -> {:ok, url}
    end
  end

  def create_url(params) do
    %Url{}
    |> Url.changeset(params)
    |> Repo.insert()
  end
end
