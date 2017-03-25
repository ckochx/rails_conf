# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :rails_conf,
  ecto_repos: [RailsConf.Repo]

# Configures the endpoint
config :rails_conf, RailsConf.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "m8SCQ70lqm+bfx932+qANaZCErBJL53UeE+SCkvIIXfTc9EtISJaOWmLGHqFqj1v",
  render_errors: [view: RailsConf.ErrorView, accepts: ~w(html json)],
  pubsub: [name: RailsConf.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
