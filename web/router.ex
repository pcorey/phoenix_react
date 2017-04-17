defmodule PhoenixReact.Router do
  use PhoenixReact.Web, :router

  scope"/graphql", PhoenixReact do
    forward "/", Absinthe.Plug, schema: PhoenixReact.Schema
  end

end
