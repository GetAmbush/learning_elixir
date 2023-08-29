defmodule ShortGhost.Repo.Migrations.CreateUrls do
  use Ecto.Migration

  def change do
    create table(:urls) do
      add :original_url, :string
      add :short_url, :string

      timestamps()
    end
  end
end
