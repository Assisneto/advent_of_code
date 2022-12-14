defmodule Day1.CalorieCounting do
  def get_elf_carrying_most_calories(input),
    do:
      input
      |> get_amount_each_elf_carries()
      |> Enum.max()

  def get_top3_elf_carrying_most_calories(input),
    do:
      input
      |> get_amount_each_elf_carries()
      |> top3()

  def top3(input),
    do:
      input
      |> Enum.sort()
      |> Enum.take(-3)
      |> Enum.sum()

  defp get_amount_each_elf_carries(input),
    do:
      input
      |> String.split("\n\n")
      |> Enum.map(&sum_elf_calories/1)

  defp sum_elf_calories(each_elf_carries),
    do:
      each_elf_carries
      |> String.split()
      |> Enum.reduce(0, fn x, acc -> String.to_integer(x) + acc end)
end
