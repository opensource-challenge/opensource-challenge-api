# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :opensource_challenge,
  ecto_repos: [OpensourceChallenge.Repo]

# Configures the endpoint
config :opensource_challenge, OpensourceChallenge.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "yilBDYvHCHT8tcgL1IpekRd4xw0CRDGzuMMjYtCK1bjh64ZjDjtGMrC0blHA9HL9",
  render_errors: [view: OpensourceChallenge.ErrorView, accepts: ~w(json json-api)],
  pubsub: [name: OpensourceChallenge.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :format_encoders,
  "json-api": Poison

config :mime, :types, %{
  "application/vnd.api+json" => ["json-api"]
}

config :ja_resource,
  repo: OpensourceChallenge.Repo

config :guardian, Guardian,
  allowed_algos: ["HS512"],
  verify_module: Guardian.JWT,
  issuer: "OpenSource Challenge",
  ttl: { 30, :days },
  verify_issuer: true,
  secret_key:
    System.get_env("GUARDIAN_SECRET") ||
    "VlZNEDbJYO1qSs3ajKCB1Cjq4PR4U7schtl7bbXSe4fVyZjf2DGrTtO3NF0Eg",
  serializer: OpensourceChallenge.GuardianSerializer

config :canary, repo: OpensourceChallenge.Repo

config :oauth2, :github,
  client_id: System.get_env("GITHUB_CLIENT_ID") ||
    "c8992decd49d183b23d7",
  client_secret: System.get_env("GITHUB_CLIENT_SECRET") ||
    "b7d210b9d6e69c608322a04d47a575f846b80c7f",
  redirect_uri: System.get_env("GITHUB_REDIRECT_URI")

config :oauth2, :google,
  client_id: System.get_env("GOOGLE_CLIENT_ID") ||
    "586953290562-c896enmb9em22uv4bc4p63h97pp111h3.apps.googleusercontent.com",
  client_secret: System.get_env("GOOGLE_CLIENT_SECRET") ||
    "LkAB93OxLLOtiioQn7lWi5hO",
  redirect_uri: System.get_env("GOOGLE_REDIRECT_URI") ||
    "http://localhost:4200/"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
