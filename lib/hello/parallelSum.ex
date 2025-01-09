defmodule ParallelSum do
  def sum(numbers) do
    # Разделим список на несколько частей
    # разбиение на 4 части
    chunk_size = div(length(numbers), 4)
    chunks = Enum.chunk_every(numbers, chunk_size)

    # Для каждого чанка создадим процесс, который посчитает сумму
    chunks
    |> Enum.map(fn chunk -> spawn(fn -> sum_chunk(chunk) end) end)
    |> Enum.map(&receive_result/1)
    |> Enum.sum()
  end

  defp sum_chunk(chunk) do
    result = Enum.sum(chunk)
    # Отправка результата в родительский процесс
    send(self(), {:sum_result, result})
  end

  defp receive_result(pid) do
    receive do
      {:sum_result, result} -> result
    after
      # Таймаут если не получен результат
      5000 -> 0
    end
  end
end

# Создаем список от 1 до 1000
numbers = Enum.to_list(1..1000)
result = ParallelSum.sum(numbers)
IO.puts("Total sum is: #{result}")
