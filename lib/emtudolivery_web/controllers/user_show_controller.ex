defmodule EmtudoliveryWeb.UserShowController do
  use EmtudoliveryWeb, :controller

  alias Emtudolivery.User
  alias EmtudoliveryWeb.FallbackController

  action_fallback FallbackController

  def handle(conn, %{"id" => user_id}) do
    with {:ok, %User{} = user} <- Emtudolivery.get_user_by_id(user_id) do
      conn
      |> put_view(EmtudoliveryWeb.UserView)
      |> render("user.json", user: user)
    end
  end
end
