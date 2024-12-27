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

  def sqrt(number) do
    Enum.reduce(1..number, 0, fn x, acc -> acc + x * x end)
  end

  def pi() do
    list = 1..10000
    Enum.map(list, fn x -> x * x end)
  end

  def factorial(n) when n == 0 do
    1
  end

  def factorial(n) when n > 0 do
    n * factorial(n - 1)
  end

  def plag_me(conn, opts) do
    IO.inspect("INSPECT PLAG OPTS")
    opts |> IO.inspect()
    IO.puts("=====================")

    IO.inspect("INSPECT CONN")

    conn
    |> IO.inspect()
    |> IO.puts("=====================")
  end

  def my_fan({arg1, arg2}) do
    arg1 + arg2
  end

  def fn_tuple() do

  end

  def area({:rec, a, b}) do
    a * b
  end

  def area({:sqr, a}) do
    a * a
  end

  def area({:circ, a}) do
    a * a * 3.14
  end
  
end
