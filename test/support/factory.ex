defmodule Emtudolivery.Factory do
  use ExMachina

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
end
