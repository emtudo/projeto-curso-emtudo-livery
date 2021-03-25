defmodule EmtudoliveryWeb.UserCreateController do
  use EmtudoliveryWeb, :controller
  alias Emtudolivery.User
  alias EmtudoliveryWeb.FallbackController

  action_fallback FallbackController

  def handle(conn, params) do
    with {:ok, %User{} = user} <- Emtudolivery.create_user(params) do
      conn
      |> put_status(:created)
      |> put_view(EmtudoliveryWeb.UserView)
      |> render("create.json", user: user)
    end
  end
end
