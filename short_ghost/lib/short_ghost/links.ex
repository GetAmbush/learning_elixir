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

  def create_url(params, short_url_provider \\ &__MODULE__.short_url/0) do
    params = Map.put(params, :short_url, short_url_provider.())

    %Url{}
    |> Url.changeset(params)
    |> Repo.insert()
  end

  @chars String.graphemes("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
  @short_url_length 6

  def short_url() do
    1..@short_url_length
    |> Enum.map(fn _ -> Enum.random(@chars) end)
    |> Enum.join("")
    |> String.to_atom()
  end
end
