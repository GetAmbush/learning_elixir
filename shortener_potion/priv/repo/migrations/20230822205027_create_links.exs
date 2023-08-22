defmodule ShortenerPotion.Repo.Migrations.CreateLinks do
  use Ecto.Migration

  def change do
    create table(:links) do
      add :original_url, :string
      add :short_url, :string
      add :access_counter, :integer
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:links, [:user_id])
  end
end
