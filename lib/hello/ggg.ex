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
 
    new = hd + current
    IO.inspect(new)
    do_plas(new, tl)
  end
end
