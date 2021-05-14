# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :zaryn, ecto_repos: [Zaryn.Repo], generators: [binary_id: true]

# Configures the endpoint
config :zaryn, ZarynWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "gezCztOVJKD3K7/pRxOCsVz2/26KpvIXP6iwcLAtR6kikK55jKMTPDbjxLrheGDc",
  render_errors: [view: ZarynWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Zaryn.PubSub,
  live_view: [signing_salt: "ywIHqVZp"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :zaryn, Zaryn.Guardian,
  issuer: "zaryn",
  secret_key: "V8U9931F//XbU9werhJuhVIIi6F0mXPufmfd9oEX5x2UzSAl+cOACWLPzLxlxyBqH+I=",
  ttl: {3, :days}

config :zaryn, ZarynWeb.AuthAccessPipeline,
  module: Zaryn.Guardian,
  error_handler: ZarynWeb.AuthErrorHandler

config :waffle,
  storage: Waffle.Storage.S3, # or Waffle.Storage.Local
  bucket: System.get_env("AWS_BUCKET_NAME") # if using S3

# If using S3:
config :ex_aws,
  json_codec: Jason,
  access_key_id: System.get_env("AWS_ACCESS_KEY_ID"),
  secret_access_key: System.get_env("AWS_SECRET_ACCESS_KEY"),
  region: System.get_env("AWS_REGION")

config :zaryn, Zaryn.Mailer,
  adapter: Bamboo.MandrillAdapter,
  api_key: "my_api_key"

config :kaffy,
   otp_app: :zaryn,
   ecto_repo: Zaryn.Repo,
   router: ZarynWeb.Router

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
