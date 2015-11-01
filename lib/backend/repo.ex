defmodule Backend.Repo do
  use Ecto.Repo,
    otp_app: :backend
    # For SQL server on Windows machine
    #,
    #adapter: Tds.Ecto
end
