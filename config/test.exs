use Mix.Config

# We run a server during test for Wallaby integration testing.
config :streets_could_talk, StreetsCouldTalkWeb.Endpoint,
  http: [port: 4001],
  server: true,
  secret_key_base: "0123456789012345678901234567890123456789012345678901234567890123456789"

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :streets_could_talk, StreetsCouldTalk.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "streets_could_talk_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :streets_could_talk, :sql_sandbox, true
