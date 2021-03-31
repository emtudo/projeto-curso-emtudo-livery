defmodule Tasks do
  def run do
    :random.seed(:os.timestamp())
    durations = Enum.shuffle(1..20)

    Enum.map(durations, fn duration -> Task.async(fn -> run_task(duration) end) end)
    |> get_first_result
    |> IO.inspect(label: "result")
  end

  defp get_first_result(tasks) do
    receive do
      msg ->
        case Task.find(tasks, msg) do
          {result, _task} ->
            # got the result
            result

          nil ->
            # no result -> continue waiting
            get_first_result(tasks)
        end
    end
  end

  defp run_task(1) do
    :success
  end

  defp run_task(duration) do
    :timer.sleep(duration * 100)
    :ok
  end
end
