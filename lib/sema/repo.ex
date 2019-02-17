defmodule Sema.Repo do
  use Ecto.Repo,
    otp_app: :sema,
    adapter: Ecto.Adapters.Postgres
end
