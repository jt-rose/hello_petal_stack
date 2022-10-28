defmodule LiveviewWithAlpine.Repo do
  use Ecto.Repo,
    otp_app: :liveview_with_alpine,
    adapter: Ecto.Adapters.Postgres
end
