defmodule Emtudolivery.Cep.Search do
  alias Emtudolivery.Cep.Brasilapi.Client, as: ClientBrasilApi
  alias Emtudolivery.Cep.ViaCep.Client, as: ClientViaCep

  def info(cep) do
    tasks = [
      Task.async(fn -> ClientBrasilApi.get_cep_info(cep) end),
      Task.async(fn -> ClientViaCep.get_cep_info(cep) end)
    ]

    cep = await(tasks)
    Enum.map(tasks, fn task -> Task.shutdown(task) end)
    {:ok, cep}
  end

  # Emtudolivery.Cep.Search.info("81750300")

  defp await(tasks) do
    receive do
      {_reply, {:ok, %{"cep" => _cep} = cep}} ->
        cep

      nil ->
        await(tasks)
    end
  end

  # defp parse(reply, task, tasks) do
  #   IO.inspect(task)
  #   {reply, List.delete(tasks, task)}
  # end

  #  defp await(tasks) do
  #    receive do
  #      message ->
  #        case Task.find(tasks, message) do
  #          {reply, task} ->
  #            {reply, List.delete(tasks, task)}
  #
  #          nil ->
  #            await(tasks)
  #        end
  #    end
  #  end
end
