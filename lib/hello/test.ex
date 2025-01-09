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

  def current_process() do
    current_process = self()

    spawn_link(fn ->
      send(current_process, {:msg, "hello world"})
    end)

    receive do
      {:msg, contents} -> IO.puts(contents)
    end
  end

  def raise_error() do
    try do
      raise "error"
    rescue
      e in RuntimeError -> IO.puts("Произошла ошибка: #{e.message}")
    end
  end

  def describe_list([]), do: "пусто"

  def describe_list([x]), do: "один элемент: #{x}"

  def describe_list([x, y]), do: "два элемента: #{x} и #{y}"

  def describe_list([x | _]), do: "много элементов, первый: #{x}"

  def operation({operation, a, b}) do
    case operation do
      :add -> a + b
      :sub -> a - b
      :div -> if b == 0, do: raise("деление на ноль"), else: a / b
      :mul -> a * b
      :mod -> rem(a, b)
      :pow -> a ** b
      _ -> raise "неизвестная операция"
    end
  end

  def calc({:add, a, b}), do: a + b
  def calc({:subtract, a, b}), do: a - b
  def calc({:multiply, a, b}), do: a * b
  def calc({:divide, _a, 0}), do: {:error, "unsupported operation"}
  def calc({:divide, a, b}), do: a / b
  def calc(_), do: {:error, "unsupported operation"}

  def filter_adults(data) do
    for {id, {_name, age}} <- data, age > 18, do: id
    # data = [{1, {"Alice", 20}}, {2, {"Bob", 17}}, {3, {"Carol", 25}}]
  end

  def maps(data) do
    case {Map.has_key?(data, :name), Map.has_key?(data, :age), Map.has_key?(data, :gender)} do
      {true, true, true} ->
        cond do
          data[:age] >= 18 and data[:gender] == "male" ->
            "Имя: #{data[:name]}, взрослый, мужчина"

          data[:age] >= 18 and data[:gender] == "female" ->
            "Имя: #{data[:name]}, взрослая, женщина"

          data[:age] < 18 ->
            "Имя: #{data[:name]}, несовершеннолетний"
        end

      _ ->
        "Неверные данные"
    end
  end

  def extract_user(user) do
    with {:ok, login} <- extract_login(user),
         {:ok, email} <- extract_email(user),
         {:ok, password} <- extract_password(user) do
      {:ok, %{login: login, email: email, password: password}}
    else
      error -> error
    end
  end

  # defp extract_login(%{"login" => login}), do: {:ok, login}
  # defp extract_login(_), do: {:error, "login missing"}
  # defp extract_email(%{"email" => email}), do: {:ok, email}
  # defp extract_email(_), do: {:error, "email missing"}
  # defp extract_password(%{"password" => password}), do: {:ok, password}
  # defp extract_password(_), do: {:error, "password missing"}

  def extract_login(%{login: login}), do: {:ok, login}
  def extract_login(_), do: {:error, "login not found"}

  def extract_email(%{email: email}), do: {:ok, email}
  def extract_email(_), do: {:error, "email not found"}

  def extract_password(%{password: password}), do: {:ok, password}
  def extract_password(_), do: {:error, "password not found"}

  def extract_users(user) do
    with {:ok, login} <- extract_login(user),
         {:ok, email} <- extract_email(user),
         {:ok, password} <- extract_password(user) do
      {:ok, %{login: login, email: email, password: password}}
      # user = %{login: "user1", email: "user1@example.com", password: "secret"}
      # Hello.Test.extract_users(user)
    end
  end

  @spec print(non_neg_integer()) :: :ok
  def print(1), do: IO.puts("1")

  def print(n) do
    print(n, [])
  end

  defp print(0, acc) do
    Enum.each(acc, &IO.puts/1)
  end

  defp print(n, acc) do
    print(n - 1, [n | acc])
  end

  def greet_ruslan do
    IO.puts(String.upcase("привет руслан"))
  end

  @spec sum([number()]) :: number()
  def sum([]), do: 0

  def sum([head | tail]) do
    summ = [head | tail]
    Enum.sum(summ)
  end
end
