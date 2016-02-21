defmodule Dijkstra do
  def gcd(a, b) when a > 0 and b > 0 do
    cond do
      a == b -> IO.puts a
      a > b -> gcd(a-b, b)
      true -> gcd(a, b-a) 
    end
  end
end