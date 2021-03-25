defmodule Emtudolivery.Factory do
  use ExMachina.Ecto, repo: Emtudolivery.Repo
  alias Emtudolivery.User

  def user_params_factory do
    %{
      address: "Rua das Laranjeiras",
      age: 20,
      cpf: "11234567893",
      email: "teste@teste.com",
      name: "O nome",
      password: "1234348897",
      cep: "12345678"
    }
  end

  def user_factory do
    %User{
      id: "783143ce-99a2-4c36-a188-5b4c832e6ba3",
      address: "Rua das Laranjeiras",
      age: 20,
      cpf: "11234567893",
      email: "teste@teste.com",
      name: "O nome",
      password: "1234348897",
      cep: "12345678"
    }
  end
end
