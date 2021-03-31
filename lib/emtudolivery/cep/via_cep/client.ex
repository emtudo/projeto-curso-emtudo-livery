defmodule Emtudolivery.Cep.ViaCep.Client do
  alias Emtudolivery.Error
  use Tesla
  alias Tesla.Env

  plug Tesla.Middleware.BaseUrl, "https://viacep.com.br/ws/"
  plug Tesla.Middleware.JSON

  def get_cep_info(cep) do
    # :timer.sleep(3000)

    "#{cep}/json/"
    |> get()
    |> handle_get()
  end

  defp handle_get({:ok, %Env{status: 200, body: %{"erro" => true}}}) do
    {:error, Error.build(:not_found, "CEP not found")}
  end

  defp handle_get({:ok, %Env{status: 400}}) do
    {:error, Error.build(:bad_request, "Invalid CEP")}
  end

  defp handle_get({:ok, %Env{status: 200, body: body}}), do: {:ok, body}
end
