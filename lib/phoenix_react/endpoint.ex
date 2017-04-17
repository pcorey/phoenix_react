defmodule PhoenixReact.Endpoint do
  use Phoenix.Endpoint, otp_app: :phoenix_react

  plug Plug.Static.IndexHtml,
    at: "/"

  socket "/socket", PhoenixReact.UserSocket

  plug Plug.Static,
    at: "/",
    from: "priv/inject-detect/build/",
    gzip: false,
    only: ~w(index.html favicon.ico static)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  plug Plug.Session,
    store: :cookie,
    key: "_phoenix_react_key",
    signing_salt: "N+klYXtL"

  plug CORSPlug, origin: ["http://localhost:3000", "http://localhost:4000"]

  plug PhoenixReact.Router
end
