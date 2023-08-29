defmodule ShortGhost.Repo do
  use Ecto.Repo,
    otp_app: :short_ghost,
    adapter: Ecto.Adapters.Postgres
end
