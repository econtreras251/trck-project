defmodule Trck.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      TrckWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Trck.PubSub},
      # Start the Endpoint (http/https)
      TrckWeb.Endpoint
      # Start a worker by calling: Trck.Worker.start_link(arg)
      # {Trck.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Trck.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    TrckWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
