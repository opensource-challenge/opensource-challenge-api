use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or you later on).
config :opensource_challenge, OpensourceChallenge.Endpoint,
  secret_key_base: System.get_env("PHOENIX_SECRET_KEY_BASE") ||
    "JfjuF1TzVv+5tEe+L3NCv53XANQOnatLCpMJFSp7IklZqTImlDWrbvBhzXzmIZVx"

# Configure your database
config :opensource_challenge, OpensourceChallenge.Repo,
  adapter: Ecto.Adapters.Postgres,
  hostname: System.get_env("DB_HOSTNAME") || "localhost",
  username: System.get_env("DB_USERNAME") || "postgres",
  password: System.get_env("DB_PASSWORD") || "postgres",
  database: System.get_env("DB_DATABASE") || "opensource_challenge_prod",
  pool_size: 20
