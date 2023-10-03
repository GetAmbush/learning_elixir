defmodule ShortGhost.Links.Url do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :original_url, :short_url]}
  schema "urls" do
    field :original_url, :string
    field :short_url, :string

    timestamps()
  end

  def create_changeset(
        %__MODULE__{} = url,
        changes,
        short_url_provider \\ &__MODULE__.generate_short_url/0
      ) do
    url
    |> cast(changes, [:original_url])
    |> update_change(:orignal_url, &String.downcase/1)
    |> validate_format(:original_url, ~r/^http/)
    |> put_change(:short_url, short_url_provider.())
    |> validate_required([:original_url, :short_url])
    |> unique_constraint(:short_url)
  end

  @chars String.graphemes("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
  @short_url_length 6

  def generate_short_url() do
    1..@short_url_length
    |> Enum.map(fn _ -> Enum.random(@chars) end)
    |> Enum.join("")
  end
end
