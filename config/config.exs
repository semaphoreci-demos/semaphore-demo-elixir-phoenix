# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :sema,
  ecto_repos: [Sema.Repo]

config :sema, Sema.Repo, pool_size: 10

# Configures the endpoint
config :sema, SemaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Zef08wblUqtybHGEUQjgM1GaqWzcDGCj9iTSR9eUzk3zptw6tDHJSX9pKveh1LWS",
  render_errors: [view: SemaWeb.ErrorView, accepts: ~w(html json)],
  pubsub_server: Sema.PubSub

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.

import_config "#{Mix.env()}.exs"
