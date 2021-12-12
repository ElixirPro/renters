defmodule Renters.Repo do
  use Ecto.Repo,
    otp_app: :renters,
    adapter: Ecto.Adapters.Postgres
end
