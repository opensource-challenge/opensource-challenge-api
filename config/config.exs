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
  render_errors: [view: OpensourceChallenge.ErrorView, accepts: ~w(json)],
  pubsub: [name: OpensourceChallenge.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
