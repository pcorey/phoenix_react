defmodule PhoenixReact.Schema do
  use Absinthe.Schema

  import_types PhoenixReact.Schema.Types

  def resolve_posts(_args, _context) do
    {:ok, [%{id: 1, title: "Title #1", body: "This is a post."}]}
  end

  query do
    field :posts, list_of(:post) do
      resolve &resolve_posts/2
    end
  end

end
