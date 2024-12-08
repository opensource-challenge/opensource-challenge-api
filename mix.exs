defmodule OpensourceChallenge.Mixfile do
  use Mix.Project

  def project do
    [
      app: :opensource_challenge,
      version: "0.0.1",
      elixir: "~> 1.2",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      test_coverage: [tool: Coverex.Task, coveralls: true]
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {OpensourceChallenge, []},
      extra_applications: [
        :logger,
        :comeonin,
        :oauth2,
        :ja_resource
      ]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.4.6"},
      {:phoenix_pubsub, "~> 1.1"},
      {:phoenix_ecto, "~> 3.3"},
      {:jason, "~> 1.1"},
      {:postgrex, "~> 0.13.5"},
      {:ja_serializer, "~> 0.15.0"},
      {:ja_resource, "~> 0.3.0"},
      {:bcrypt_elixir, "~> 2.0"},
      {:guardian, "~> 1.2.1"},
      {:canada, "~> 2.0.0", override: true},
      {:canary, "~> 1.1.0"},
      {:gettext, "~> 0.11"},
      {:plug_cowboy, "~> 2.0"},
      {:oauth2, "~> 2.0"},
      {:cors_plug, "~> 2.0.0"},
      {:coverex, "~> 1.5.0", only: :test}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
