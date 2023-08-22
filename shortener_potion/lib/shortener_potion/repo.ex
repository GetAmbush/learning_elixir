defmodule ShortenerPotion.Repo do
  use Ecto.Repo,
    otp_app: :shortener_potion,
    adapter: Ecto.Adapters.Postgres
end
