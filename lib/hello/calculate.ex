defmodule Hello.Calculate do
    def test (nam) do
      Enum.reduce(nam, 0, fn x, acc -> acc * x * x end)
    end
end
