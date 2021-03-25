defmodule EmtudoliveryWeb.UserView do
  use EmtudoliveryWeb, :view
  alias Emtudolivery.User

  def render("create.json", %{user: %User{} = user}) do
    %{
      message: "User created!",
      user: handle_user(user)
    }
  end

  def render("user.json", %{user: %User{} = user}) do
    %{
      message: "User show!",
      user: handle_user(user)
    }
  end

  defp handle_user(%User{} = user) do
    %{
      id: user.id,
      name: user.name,
      email: user.email,
      address: user.address,
      age: user.age,
      cep: user.cep
    }
  end
end
