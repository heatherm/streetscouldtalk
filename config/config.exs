# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :streets_could_talk,
  ecto_repos: [StreetsCouldTalk.Repo]

# Configures the endpoint
config :streets_could_talk, StreetsCouldTalkWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: StreetsCouldTalkWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: StreetsCouldTalk.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :template_engines,
  slim: PhoenixSlime.Engine

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
