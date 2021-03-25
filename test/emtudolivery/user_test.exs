defmodule Emtudolivery.UserTest do
  use Emtudolivery.DataCase, async: true
  alias Ecto.Changeset
  alias Emtudolivery.User

  import Emtudolivery.Factory

  describe "changeset/2" do
    test "when all params are valid, returns a valid changeset" do
      params = build(:user_params)
      response = User.changeset(params)

      assert %Changeset{changes: %{name: "O nome"}, valid?: true} = response
    end

    test "when updating a changeset, returns valid changeset with the give changes" do
      params = build(:user_params)

      update_params = %{name: "Outro nome"}

      response =
        params
        |> User.changeset()
        |> User.changeset(update_params)

      assert %Changeset{changes: %{name: "Outro nome"}, valid?: true} = response
    end

    test "when there are some error, returns an invalid changeset" do
      params = build(:user_params, %{age: 3, password: "12"})

      response = User.changeset(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["should be at least 8 character(s)"]
      }

      assert errors_on(response) == expected_response
    end
  end
end
