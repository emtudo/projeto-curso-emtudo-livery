defmodule EmtudoliveryWeb.UserView do
  use EmtudoliveryWeb, :view
  alias Emtudolivery.User

  def render("create.json", %{user: %User{} = user}) do
    %{
      message: "User created!",
      user: user
    }
  end

  def render("user.json", %{user: %User{} = user}), do: %{user: user}
end
