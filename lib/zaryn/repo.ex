defmodule Zaryn.Repo do
  use Ecto.Repo,
    otp_app: :zaryn,
    adapter: Ecto.Adapters.Postgres
end
