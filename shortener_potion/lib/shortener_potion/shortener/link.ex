defmodule ShortenerPotion.Shortener.Link do
  use Ecto.Schema
  import Ecto.Changeset

  alias ShortenerPotion.Accounts.User

  schema "links" do
    field :original_url, :string
    field :short_url, :string
    field :access_counter, :integer

    belongs_to(:user, User, type: :id)

    timestamps()
  end

  @doc false
  def changeset(link, attrs) do
    link
    |> cast(attrs, [:original_url, :short_url, :access_counter])
    |> validate_required([:original_url, :short_url, :access_counter])
  end
end
