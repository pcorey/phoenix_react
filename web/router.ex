defmodule PhoenixReact.Router do
  use PhoenixReact.Web, :router

  forward "/graphql", Absinthe.Plug, schema: PhoenixReact.Schema

end
