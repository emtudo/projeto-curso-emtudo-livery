defmodule EmtudoliveryWeb.UserViewTest do
  use EmtudoliveryWeb.ConnCase, async: true
  alias EmtudoliveryWeb.UserView

  import Phoenix.View
  import Emtudolivery.Factory

  test "renders create.json" do
    user = build(:user)

    response = render(UserView, "create.json", user: user)

    expected_response = %{
      message: "User created!",
      user: %Emtudolivery.User{
        address: "Rua das Laranjeiras",
        age: 20,
        cep: "12345678",
        email: "teste@teste.com",
        id: "783143ce-99a2-4c36-a188-5b4c832e6ba3",
        name: "O nome",
        cpf: "11234567893",
        inserted_at: nil,
        password: "1234348897",
        password_hash: nil,
        updated_at: nil
      }
    }

    assert response == expected_response
  end

  test "renders user.json" do
    user = build(:user)

    response = render(UserView, "user.json", user: user)

    expected_response = %{
      user: %Emtudolivery.User{
        address: "Rua das Laranjeiras",
        age: 20,
        cep: "12345678",
        email: "teste@teste.com",
        id: "783143ce-99a2-4c36-a188-5b4c832e6ba3",
        name: "O nome",
        cpf: "11234567893",
        inserted_at: nil,
        password: "1234348897",
        password_hash: nil,
        updated_at: nil
      }
    }

    assert response == expected_response
  end
end
