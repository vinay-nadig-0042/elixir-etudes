defmodule Stats do
  def minimum(list) do
    [head | tail] = list
    minimum(tail, head)
  end

  def minimum([], smallest) do
    smallest
  end

  def minimum([head | tail], smallest) when head <= smallest do
    minimum(tail, head)
  end

  def minimum([head | tail], smallest) when head > smallest do
    minimum(tail, smallest)
  end

  def maximum(list) do
    [head | tail] = list
    maximum(tail, head)
  end

  def maximum([], largest) do
    largest
  end

  def maximum([head | tail], largest) when head >= largest do
    maximum(tail, head)
  end

  def maximum([head | tail], largest) when head < largest do
    maximum(tail, largest)
  end

  def range(list) do
    [max, min] = [maximum(list), minimum(list)]
  end
end