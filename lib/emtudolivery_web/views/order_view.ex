defmodule EmtudoliveryWeb.OrderView do
  use EmtudoliveryWeb, :view
  alias Emtudolivery.Order

  def render("create.json", %{order: %Order{} = order}) do
    %{
      message: "Order created!",
      order: order
    }
  end

  def render("order.json", %{order: %Order{} = order}), do: %{order: order}
end
