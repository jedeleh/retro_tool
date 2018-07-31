use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :retro_tool, RetroToolWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :retro_tool, RetroTool.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "ncsadb_user",
  password: "",
  database: "retro_tool_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
