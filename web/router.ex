defmodule Backend.Router do
  use Backend.Web, :router

  pipeline :api do
    plug :accepts, ["json", "application/vnd.api+json"]
  end

  scope "/api", Backend do
    pipe_through :api

    resources "/orders", OrderController
    options "/orders*anything", OrderController, :options

    resources "/activities", ActivityController
    options "/activities*anything", ActivityController, :options

    resources "/resources", ResourceController
    options "/resources*anything", ResourceController, :options
  end

end
