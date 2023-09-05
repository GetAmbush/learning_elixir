defmodule ShortGhost.Links.Url do
  use Ecto.Schema
  import Ecto.Changeset

  schema "urls" do
    field :original_url, :string
    field :short_url, :string

    timestamps()
  end

  def changeset(%__MODULE__{} = url, changes) do
    url
    |> cast(changes, [:original_url, :short_url])
    |> update_change(:orignal_url, &String.downcase/1)
    |> validate_required([:original_url, :short_url])
    |> validate_format(:original_url, ~r/^http/)
    |> unique_constraint(:short_url)
  end
end
