defmodule Day03 do
  def run(input_text) do
    input_text
    |> String.split("\n")
    |> Enum.map(&Rucksack.from_string/1)
    |> IO.inspect()
  end
end

defmodule Rucksack do
  defstruct [:first, :second]

  def from_string(input) do
    len = div(String.length(input), 2)
    {first, second} = String.split_at(input, len)

    %Rucksack{first: first, second: second}
  end

  def repeated_item(%Rucksack{} = rucksack) do
    first_mapset = rucksack.first |> String.graphemes() |> MapSet.new()
    second_mapset = rucksack.second |> String.graphemes() |> MapSet.new()

    MapSet.intersection(first_mapset, second_mapset) |> Enum.to_list() |> Enum.at(0)
  end
end
