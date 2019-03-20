ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Sema.Repo, :manual)

{:ok, _apps} = Application.ensure_all_started(:wallaby)
Application.put_env(:wallaby, :base_url, SemaWeb.Endpoint.url())
