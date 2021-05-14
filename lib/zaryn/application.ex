defmodule Zaryn.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Zaryn.Repo,
      # Start the Telemetry supervisor
      ZarynWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Zaryn.PubSub},
      # Start the Endpoint (http/https)
      ZarynWeb.Endpoint
      # Start a worker by calling: Zaryn.Worker.start_link(arg)
      # {Zaryn.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Zaryn.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ZarynWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
