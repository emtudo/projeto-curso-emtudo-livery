defmodule EmtudoliveryWeb.UserCreateControllerTest do
  use EmtudoliveryWeb.ConnCase, async: true

  import Emtudolivery.Factory

  describe "handle/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      params = build(:user_params)

      response =
        conn
        |> post(Routes.user_create_path(conn, :handle), params)
        |> json_response(:created)

      assert %{
               "message" => "User created!",
               "user" => %{
                 "email" => "teste@teste.com",
                 "id" => _id
               }
             } = response
    end

    test "when there is some error, returns an error", %{conn: conn} do
      params = %{
        name: "Leandro"
      }

      response =
        conn
        |> post(Routes.user_create_path(conn, :handle), params)
        |> json_response(:bad_request)

      expected_response = %{
        "errors" => %{
          "address" => ["can't be blank"],
          "age" => ["can't be blank"],
          "cep" => ["can't be blank"],
          "cpf" => ["can't be blank"],
          "email" => ["can't be blank"],
          "password" => ["can't be blank"]
        }
      }

      assert expected_response == response
    end
  end
end
