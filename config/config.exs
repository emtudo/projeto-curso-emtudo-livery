# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :emtudolivery,
  ecto_repos: [Emtudolivery.Repo]

config :emtudolivery, EmtudoliveryWeb.Auth.Guardian,
  issuer: "emtudolivery",
  secret_key: "dduOHdwSr6toH1+RukfvsUekTJxMKGQbGcDywTYNelsQOKZJG5clVKw2GaxpniXp"

config :emtudolivery, Emtudolivery.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

# Configures the endpoint
config :emtudolivery, EmtudoliveryWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "CxLuCUuJXUiC9Pv7vRAB+U0Ubzgk+2Akhif7RLi1JOpTwKbypffmMGbwnqzh5rPM",
  render_errors: [view: EmtudoliveryWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Emtudolivery.PubSub,
  live_view: [signing_salt: "TDIhtDYr"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
