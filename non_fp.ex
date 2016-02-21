defmodule NonFP do
  def generate_pockets(string, prob) do
    generate_pockets(string, prob, [])
  end

  def generate_pockets([], _, acc) do
    acc
  end

  def generate_pockets(['T' | tail], prob, acc) do

  end

  def generate_tooth(prob) do
    
  end

  def generate_pockets(['F' | tail], prob, acc) do
    generate_pockets(tail, prob, [[0] | acc])
  end

  def generate_pockets([head | tail], prob, acc) do

  end
end