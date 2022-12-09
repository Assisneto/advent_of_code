defmodule Day2.RockPaperScissors do
  def strategy_guide(input) do
    input
    |> String.split("\n")
    |> calc(0)
  end

  # def calc([], acc \\ 0)

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

  def calc([], acc) do
    acc
  end

  def pair([a, b]) when a == "A" and b == "Y", do: 8
  # def pair([a, b]) when a == "A" and b == "Z", do: 7
  def pair([a, b]) when a == "B" and b == "Z", do: 9
  def pair([a, b]) when a == "C" and b == "X", do: 7

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

  #   def pair([_, b]) do
  # }

  #     mapper[b]
  #   end
end
