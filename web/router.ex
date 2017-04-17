defmodule PhoenixReact.Router do
  use PhoenixReact.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PhoenixReact do
    pipe_through :api
  end
end
