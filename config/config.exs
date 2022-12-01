# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :mongo,
  ecto_repos: [Mongo.Repo]

# Configures the endpoint
config :mongo, MongoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pQQQuHYykSudx7M7WEzvOtkntK3cgoZjBDfHjJbAQfGXEWjGlyj5Xml8qXOnI3BD",
  render_errors: [view: MongoWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Mongo.PubSub,
  live_view: [signing_salt: "qVwXNd6A"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
