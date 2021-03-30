defmodule EmtudoliveryWeb.OrderCreateController do
  use EmtudoliveryWeb, :controller
  alias Emtudolivery.Order
  alias EmtudoliveryWeb.FallbackController

  action_fallback FallbackController

  def handle(conn, params) do
    with {:ok, %Order{} = order} <- Emtudolivery.create_order(params) do
      conn
      |> put_status(:created)
      |> put_view(EmtudoliveryWeb.OrderView)
      |> render("create.json", order: order)
    end
  end
end
