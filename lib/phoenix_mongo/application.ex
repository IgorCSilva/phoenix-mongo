defmodule PhoenixMongo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do

    import Supervisor.Spec

    children = [
      # Start the Ecto repository
      PhoenixMongo.Repo,
      # Start the Telemetry supervisor
      PhoenixMongoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: PhoenixMongo.PubSub},
      # Start the Endpoint (http/https)
      PhoenixMongoWeb.Endpoint,
      worker(Mongo, [[name: :mongo, url: "mongodb://igor:1234@phoenix_mongo_db2:27017/admin", pool_size: 2]])
      # Start a worker by calling: PhoenixMongo.Worker.start_link(arg)
      # {PhoenixMongo.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixMongo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PhoenixMongoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
