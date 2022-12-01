defmodule Mongo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Mongo.Repo,
      # Start the Telemetry supervisor
      MongoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Mongo.PubSub},
      # Start the Endpoint (http/https)
      MongoWeb.Endpoint
      # Start a worker by calling: Mongo.Worker.start_link(arg)
      # {Mongo.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Mongo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    MongoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
