import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :short_ghost, ShortGhost.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "short_ghost_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :short_ghost, ShortGhostWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "qdnBz0Z195TUln3nr1phP7J3Jdw2bA704S34XJ3JLUkrOt28IiEIlVU3dY+SnroY",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
