use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :rails_conf, RailsConf.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :rails_conf, RailsConf.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "ck",
  # password: "postgres",
  database: "rails_conf_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
