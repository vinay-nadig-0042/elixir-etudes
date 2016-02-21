defmodule Geom do

  def area(shape, a, b) do
    if a < 0 or b < 0 do
      IO.puts("Both Numbers should be greater than or equal to 0")
    else
      case shape do
        :rectangle -> a * b
        :triangle  -> a * b / 2.0
        :ellipse   -> :math.pi * a * b
        _          -> 0
      end
    end
  end
end