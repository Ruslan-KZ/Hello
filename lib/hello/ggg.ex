defmodule NaturalNums do
  @spec print(pos_integer()) :: :ok
  def print(1), do: IO.puts(1)

  def print(n) do
    print(n - 1)
    IO.puts(n)
  end

  def sum_to_n(n) do
    sum_to_n(n, 0)
  end

  defp sum_to_n(0, acc), do: acc
  defp sum_to_n(n, acc), do: sum_to_n(n - 1, acc + n)

  def plas(list) do
    IO.inspect(list)
    do_plas(0, list)
  end

  defp do_plas(current, []) do
    current
  end

  defp do_plas(current, [hd | tl]) do
    do_plas(hd + current, tl)
  end

  def map(%{a: a, b: b, c: c}) do
    send(self(), {:map, a + b + c})
  end

  def map(map) do
    receive do
      {:message_type, value} ->
        value + 1 + map + 1 + map
    end
  end

  def spawn do
    spawn(fn -> IO.puts("Hello") end)
  end

  def read(file_path) do
    case File.read(file_path) do
      {:ok, content} ->
        content  # Возвращает содержимое файла
      {:error, reason} ->
        "Failed to read file: #{inspect(reason)}"  # Обрабатывает ошибки
    end
  end



end
