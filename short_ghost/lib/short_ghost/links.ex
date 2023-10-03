defmodule ShortGhost.Links do
  alias ShortGhost.Repo

  alias ShortGhost.Links.Url

  def fetch_url(short_url) do
    Url
    |> Repo.get_by(short_url: short_url)
    |> case do
      nil -> {:error, :url_does_not_exist}
      %Url{} = url -> {:ok, url}
    end
  end

  def create_url(params, short_url_provider \\ &Url.generate_short_url/0) do
    %Url{}
    |> Url.create_changeset(params, short_url_provider)
    |> Repo.insert()
  end
end
