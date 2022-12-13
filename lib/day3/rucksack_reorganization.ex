defmodule Day3.RucksackReorganization do
  alias MapSet

  def prioritize_rearrangement(input) do
    input
    |> String.split("\n")
    |> calc_prioritize_rearrangement(0)
  end

  defp calc_prioritize_rearrangement([head | tail], acc) do
    mid = Integer.floor_div(String.length(head), 2)

    <<ascii::utf8>> =
      String.split_at(head, mid)
      |> get_common_letter()

    calc_prioritize_rearrangement(tail, acc + calc(ascii))
  end

  defp calc_prioritize_rearrangement([], acc), do: acc

  defp get_common_letter({first_part, second_part}) do
    first_part_list = string_to_mapset(first_part)
    second_part_list = string_to_mapset(second_part)

    [head | _] =
      MapSet.intersection(first_part_list, second_part_list)
      |> MapSet.to_list()

    head
  end

  defp string_to_mapset(string), do: String.graphemes(string) |> MapSet.new()

  defp calc(ascii) when ascii >= 97, do: ascii - 97 + 1

  defp calc(ascii), do: ascii - 65 + 27
end
