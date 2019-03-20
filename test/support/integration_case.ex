defmodule SemaWeb.IntegrationCase do
  @moduledoc """
  This module defines the test case to be used by
  integration tests.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.DSL

      alias Sema.Repo
      import Ecto
      import Ecto.{Changeset, Query}

      alias SemaWeb.Router.Helpers, as: Routes
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Sema.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Sema.Repo, {:shared, self()})
    end

    metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(Sema.Repo, self())
    {:ok, session} = Wallaby.start_session(metadata: metadata)
    {:ok, session: session}
  end
end
