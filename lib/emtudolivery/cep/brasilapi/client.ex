defmodule Emtudolivery.Cep.Brasilapi.Client do
  alias Emtudolivery.Error
  use Tesla
  alias Tesla.Env

  plug Tesla.Middleware.BaseUrl, "https://brasilapi.com.br/api/cep/v1/"
  plug Tesla.Middleware.JSON

  def get_cep_info(cep) do
    # :timer.sleep(1000)

    "#{cep}"
    |> get()
    |> handle_get()
  end

  defp handle_get({:ok, %Env{status: 404}}) do
    {:error, Error.build(:not_found, "CEP not found")}
  end

  defp handle_get({:ok, %Env{status: 200, body: body}}), do: {:ok, body}
end
