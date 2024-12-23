defmodule Hello.Test do
  def replace(list) do
    Enum.with_index(list)
    |> Enum.map(fn {value, index} -> value * index end)
  end

  def remove(list) do
    Enum.filter(list, fn x -> div(x, 3) == 0 end)
  end

  def upcase(list) do
    Enum.map(list, fn x -> String.upcase(x) end)
  end

  def update_list(list) do
    Enum.filter(list, fn x -> rem(x, 2) == 0 end)
  end

  def odd_nambers(list) do
    Enum.filter(list, fn x -> rem(x, 2) != 0 end)
    |> IO.inspect(label: "отфильтрованный список")
    |> Enum.sum()
  end

  def short_list(list) do
    Enum.map(list, fn x ->
      if String.length(x) < 4 do
        "SHORT"
      else
        x
      end
    end)
  end

  
end
