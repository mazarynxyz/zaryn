defmodule Zaryn.MixProject do
  use Mix.Project
  def project do
    [
      app: :zaryn,
      version: "0.1.0",
      elixir: "~> 1.10",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end
  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Zaryn.Application, []},
      extra_applications: [:logger, :runtime_tools]
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
      # Absinthe for GraphQL
      {:absinthe, "~> 1.6.3"},
      {:absinthe_plug, "~> 1.5.5"},

      # Kaffy administration
      {:kaffy, "~> 0.9.0"},

      {:guardian, "~> 2.0"},
      {:phoenix, "~> 1.5.9"},
      {:phoenix_ecto, "~> 4.1"},
      {:ecto_sql, "~> 3.4"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_live_view, "~> 0.15.0"},
      {:phoenix_html, "~> 2.11"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_live_dashboard, "~> 0.4"},
      {:telemetry_metrics, "~> 0.4"},
      {:telemetry_poller, "~> 0.4"},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"},
      # Additional packages

      # Bamboo for Emailing
      {:bamboo, "~> 1.5"},
      {:premailex, "~> 0.3.0"},
      {:floki, ">= 0.0.0"},

      # Waffle for file upload
      {:waffle, "~> 1.1.1"},
      {:waffle_ecto, "~> 0.0.9"},
      # If using Waffle with S3:
      {:ex_aws, "~> 2.1.2"},
      {:ex_aws_s3, "~> 2.0"},
      {:hackney, "~> 1.9"},
      {:sweet_xml, "~> 0.6"},
      {:phx_gen_auth, "~> 0.6", only: [:dev], runtime: false},
      {:pbkdf2_elixir, "~> 1.4"},
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},
      {:sobelow, "~> 0.8", only: :dev},
      {:ecto_psql_extras, "~> 0.2"},
    ]
  end
  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "ecto.setup", "cmd npm install --prefix assets"],
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate --quiet", "test"]
    ]
  end
end
