defmodule Day2.RockPaperScissors do
  def strategy_guide(input),
    do:
      input
      |> String.split("\n")
      |> calc(0)

  #   a = pedra
  #   b = papel
  #   c = tesoura
  #   x = pedra
  #   y = papel
  #   z = tesoura

  def calc([head | tail], acc) do
    score = head |> String.split(" ") |> pair()
    calc(tail, acc + score)
  end

  def calc([], acc), do: acc

  def pair(["A", "Y"]), do: 8
  def pair(["B", "Z"]), do: 9
  def pair(["C", "X"]), do: 7

  def pair([a, b]) do
    mapper = %{
      "A" => "X",
      "B" => "Y",
      "C" => "Z"
    }

    mapper1 = %{
      "X" => 1,
      "Y" => 2,
      "Z" => 3
    }

    if b == mapper[a] do
      3 + mapper1[b]
    else
      mapper1[b]
    end
  end
end
