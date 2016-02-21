defmodule Powers do
  def raisex(_, 0) do
    1
  end

  def raisex(x, n) when n < 0 do
    1.0 / raisex(x, -n)
  end

  def raisex(x, n) when n > 0 do
    raisex(x, n, 1)
  end

  defp raisex(_x, 0, accumulator) do
    accumulator
  end

  defp raisex(x, n, accumulator) do
    raisex(x, n - 1, x * accumulator)
  end


  def nth_root(x, n) do
    nth_root(x, n, x/2.0)
  end

  defp nth_root(x, n, approx) do
    IO.puts approx
    f = raisex(approx, n) - x
    f_prime = n * raisex(approx, n-1)
    next_approx = approx - f/f_prime
    if (approx - next_approx) < 1.0e-8 do
      IO.puts abs(approx)
    else
      nth_root(x, n, next_approx)
    end
  end
end