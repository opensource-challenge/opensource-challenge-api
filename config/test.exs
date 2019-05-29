use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :opensource_challenge, OpensourceChallengeWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :opensource_challenge, OpensourceChallenge.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "opensource_challenge_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :bcrypt_elixir, :log_rounds, 2
