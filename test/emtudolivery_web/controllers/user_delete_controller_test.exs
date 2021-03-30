defmodule EmtudoliveryWeb.UserDeleteControllerTest do
  use EmtudoliveryWeb.ConnCase, async: true

  import Emtudolivery.Factory

  describe "handle/2" do
    test "when there is a user with the given id, deletes the user", %{conn: conn} do
      user = insert(:user)

      response =
        conn
        |> delete(Routes.user_delete_path(conn, :handle, user.id))
        |> response(:no_content)

      assert response == ""
    end

    test "when there isnt user with the given id, returns error", %{conn: conn} do
      response =
        conn
        |> delete(Routes.user_delete_path(conn, :handle, "783143ce-99a2-4c36-a188-5b4c832e6ba3"))
        |> response(:not_found)

      expected_resposne = "{\"message\":\"User not found.\"}"

      assert response == expected_resposne
    end

    test "when id is invalid, returns error", %{conn: conn} do
      response =
        conn
        |> delete(Routes.user_delete_path(conn, :handle, "783143ce"))
        |> response(:bad_request)

      expected_resposne = "{\"message\":\"Invalid UUID.\"}"

      assert response == expected_resposne
    end
  end
end
