defmodule ShortGhost.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ShortGhostWeb.Telemetry,
      ShortGhost.Repo,
      {Phoenix.PubSub, name: ShortGhost.PubSub},
      ShortGhostWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: ShortGhost.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    ShortGhostWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
