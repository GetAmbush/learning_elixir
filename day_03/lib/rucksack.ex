defmodule Rucksack do
  defstruct [:first, :second]

  def from_string(input) do
    len = div(String.length(input), 2)
    {first, second} = String.split_at(input, len)

    %__MODULE__{first: first, second: second}
  end

  def repeated_item(%__MODULE__{} = rucksack) do
    first_mapset = rucksack.first |> String.graphemes() |> MapSet.new()
    second_mapset = rucksack.second |> String.graphemes() |> MapSet.new()

    first_mapset
    |> MapSet.intersection(second_mapset)
    |> Enum.to_list()
    |> Enum.at(0)
  end

  def items(%__MODULE__{} = rucksack) do
    "#{rucksack.first}#{rucksack.second}"
  end
end
