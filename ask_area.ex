defmodule AskArea do
  def char_to_shape(char) do
    case char do
      "R"  -> :rectangle
      "T"  -> :triangle
      "E"  -> :ellipse
      _ -> :unknown
    end
  end

  def binary_to_integer(input) do
    Float.parse(input)
  end

  def get_number(prompt) do
    input = IO.gets "Enter " <> prompt
    input = String.strip(input)
    binary_to_integer(input)
  end

  def get_dimensions(prompt1, prompt2) do
    {n1, _} = get_number(prompt1)
    {n2, _} = get_number(prompt2)
    {n1, n2}
  end

  def calculate(shape, n1, n2) do
    Geom.area(shape, n1, n2)
  end

  def area() do
    type = IO.gets "R)ectangle, T)riangle, or E)llipse:"
    type = String.first(type)
    type = String.upcase(type)
    type = char_to_shape(type)
    case type do
      :rectangle -> 
        {n1, n2} = get_dimensions("width", "height")
        calculate(type, n1, n2)
      :triangle  ->
        {n1, n2} = get_dimensions("base", "height")
        calculate(type, n1, n2)
      :ellipse   -> 
        {n1, n2} = get_dimensions("major radius", "minor radius")
        calculate(type, n1, n2)
      :unknown   -> IO.puts "Unknown Shape"
    end
  end
end
