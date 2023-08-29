defmodule ShortGhost.Links.Url do
  use Ecto.Schema
  import Ecto.Changeset

  schema "urls" do
    field :original_url, :string
    field :short_url, :string

    timestamps()
  end

  @doc false
  def changeset(url, attrs) do
    url
    |> cast(attrs, [:original_url, :short_url])
    |> validate_required([:original_url, :short_url])
  end
end
