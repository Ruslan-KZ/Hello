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
        content

      {:error, reason} ->
        "Failed to read file: #{inspect(reason)}"
    end
  end

  def calculate_length([]), do: 0
  def calculate_length([_head | tail]), do: 1 + calculate_length(tail)

  def range(from, to) when from <= to do
    [from | range(from + 1, to)]
  end

  def range(_from, _to), do: []

  def positive(list) do
    do_positive([], list)
  end

  defp do_positive(acc, []), do: acc


  defp do_positive(acc, [head | tail]) do
    if rem(head, 2) == 0 do
      do_positive([head | acc], tail)
    else
      do_positive(acc, tail)
    end
  end
end
