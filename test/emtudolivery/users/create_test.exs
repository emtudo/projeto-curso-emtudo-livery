defmodule Emtudolivery.Users.CreateTest do
  use Emtudolivery.DataCase, async: true
  alias Emtudolivery.Users.Create
  alias Emtudolivery.{Error, User}

  import Emtudolivery.Factory

  describe "call/1" do
    test "when all params ara valid, returns user" do
      params = build(:user_params)

      response = Create.call(params)

      assert {:ok,
              %User{
                id: _id,
                address: "Rua das Laranjeiras",
                age: 20,
                cpf: "11234567893",
                email: "teste@teste.com",
                name: "O nome",
                password: "1234348897",
                cep: "12345678"
              }} = response
    end

    test "when there are invalid params, returns an error" do
      params = build(:user_params, age: 1, password: "1")

      response = Create.call(params)
      assert {:error, %Error{status: :bad_request, result: changeset}} = response

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["should be at least 8 character(s)"]
      }

      assert errors_on(changeset) == expected_response
    end
  end
end
