use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :sema, SemaWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :sema, Sema.Repo, pool: Ecto.Adapters.SQL.Sandbox

if url = System.get_env("DATABASE_URL") do
  config :sema, Sema.Repo, url: url
else
  config :sema, Sema.Repo, database: "sema_test"
end
