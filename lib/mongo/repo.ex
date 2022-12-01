defmodule Mongo.Repo do
  use Ecto.Repo,
    otp_app: :mongo,
    adapter: Ecto.Adapters.Postgres
end
