defmodule EmtudoliveryWeb.ItemCreateController do
  use EmtudoliveryWeb, :controller
  alias Emtudolivery.Item
  alias EmtudoliveryWeb.FallbackController

  action_fallback FallbackController

  def handle(conn, params) do
    with {:ok, %Item{} = item} <- Emtudolivery.create_item(params) do
      conn
      |> put_status(:created)
      |> put_view(EmtudoliveryWeb.ItemView)
      |> render("create.json", item: item)
    end
  end
end
