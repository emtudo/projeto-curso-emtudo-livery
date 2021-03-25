defmodule EmtudoliveryWeb.UserUpdateController do
  use EmtudoliveryWeb, :controller

  alias Emtudolivery.User
  alias EmtudoliveryWeb.FallbackController

  action_fallback FallbackController

  def handle(conn, params) do
    with {:ok, %User{} = user} <- Emtudolivery.update_user(params) do
      conn
      |> put_view(EmtudoliveryWeb.UserView)
      |> render("user.json", user: user)
    end
  end
end
