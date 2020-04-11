defmodule CoinFlip.Repo do
  use Ecto.Repo,
    otp_app: :coin_flip,
    adapter: Ecto.Adapters.Postgres
end
