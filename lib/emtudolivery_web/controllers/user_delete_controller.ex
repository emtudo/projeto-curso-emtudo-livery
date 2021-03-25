defmodule EmtudoliveryWeb.UserDeleteController do
  use EmtudoliveryWeb, :controller

  alias Emtudolivery.User
  alias EmtudoliveryWeb.FallbackController

  action_fallback FallbackController

  def handle(conn, %{"id" => user_id}) do
    with {:ok, %User{}} <- Emtudolivery.delete_user(user_id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end
end
