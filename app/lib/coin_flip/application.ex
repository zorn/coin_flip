defmodule CoinFlip.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the Ecto repository
      CoinFlip.Repo,
      # Start the endpoint when the application starts
      CoinFlipWeb.Endpoint
      # Starts a worker by calling: CoinFlip.Worker.start_link(arg)
      # {CoinFlip.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CoinFlip.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    CoinFlipWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
