defmodule Renters.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Renters.Repo,
      # Start the Telemetry supervisor
      RentersWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Renters.PubSub},
      # Start the Endpoint (http/https)
      RentersWeb.Endpoint
      # Start a worker by calling: Renters.Worker.start_link(arg)
      # {Renters.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Renters.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RentersWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
