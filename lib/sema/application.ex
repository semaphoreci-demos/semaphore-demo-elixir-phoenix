defmodule Sema.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      {Phoenix.PubSub, name: Sema.PubSub},
      # Start the Ecto repository
      Sema.Repo,
      # Start the endpoint when the application starts
      SemaWeb.Endpoint
      # Starts a worker by calling: Sema.Worker.start_link(arg)
      # {Sema.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Sema.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    SemaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
