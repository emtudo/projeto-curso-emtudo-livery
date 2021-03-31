defmodule EmtudoliveryWeb.Router do
  use EmtudoliveryWeb, :router
  alias EmtudoliveryWeb.Plugs.UUIDChecker

  pipeline :api do
    plug :accepts, ["json"]
    plug UUIDChecker
  end

  scope "/api", EmtudoliveryWeb do
    pipe_through :api

    get "/", WelcomeIndexController, :handle

    post "/users", UserCreateController, :handle
    get "/users/:id", UserShowController, :handle
    delete "/users/:id", UserDeleteController, :handle
    put "/users/:id", UserUpdateController, :handle

    post "/items", ItemCreateController, :handle
    post "/orders", OrderCreateController, :handle
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: EmtudoliveryWeb.Telemetry
    end
  end
end
