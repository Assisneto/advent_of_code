defmodule Day2.RockPaperScissors do
  def strategy_guide(input),
    do:
      input
      |> String.split("\n")
      |> calc_strategy_guide(0)

  def strategy_guide2(input),
    do:
      input
      |> String.split("\n")
      |> calc_strategy_guide2(0)

  defp calc_strategy_guide([head | tail], acc) do
    score = head |> String.split(" ") |> strategy_guide_pair()
    calc_strategy_guide(tail, acc + score)
  end

  defp calc_strategy_guide([], acc), do: acc

  defp calc_strategy_guide2([head | tail], acc) do
    score = head |> String.split(" ") |> strategy_guide2_pair()
    calc_strategy_guide2(tail, acc + score)
  end

  defp calc_strategy_guide2([], acc), do: acc

  defp strategy_guide_pair(["A", "Y"]), do: 8
  defp strategy_guide_pair(["B", "Z"]), do: 9
  defp strategy_guide_pair(["C", "X"]), do: 7

  defp strategy_guide_pair([a, b]) do
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

  defp strategy_guide2_pair([a, b]), do: mapper([a, b])

  defp mapper([a, "X"]) do
    mapperX = %{
      "A" => 3,
      "B" => 1,
      "C" => 2
    }

    mapperX[a]
  end

  defp mapper([a, "Y"]) do
    mapperY = %{
      "A" => 4,
      "B" => 5,
      "C" => 6
    }

    mapperY[a]
  end

  defp mapper([a, "Z"]) do
    mapperZ = %{
      "A" => 8,
      "B" => 9,
      "C" => 7
    }

    mapperZ[a]
  end
end
