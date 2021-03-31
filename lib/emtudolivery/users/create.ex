defmodule Emtudolivery.Users.Create do
  alias Emtudolivery.Cep.Search
  alias Emtudolivery.{Error, Repo, User}

  def call(%{"cep" => cep} = params) do
    changeset = User.changeset(params)

    with {:ok, %User{}} <- User.build(changeset),
         {:ok, _cep_info} <- Search.info(cep),
         {:ok, %User{}} = user <- Repo.insert(changeset) do
      user
    else
      {:error, %Error{}} = error -> error
      {:error, result} -> {:error, Error.build(:bad_request, result)}
    end

    # case Search.info(cep) do
    #   {:ok, _} -> create_user(params)
    #   {:error, _reason} = error -> error
    # end
  end

  # defp create_user(params) do
  #   params
  #   |> User.changeset()
  #   |> Repo.insert()

  #   # |> handle_insert()
  # end

  # defp handle_insert({:ok, %User{}} = result), do: result

  # defp handle_insert({:error, result}), do: {:error, Error.build(:bad_request, result)}
end
