defmodule Day03 do
  def run(input_text) do
    input_text
    |> String.split("\n", trim: true)
    |> Enum.map(&Rucksack.from_string/1)
    |> Enum.map(&Rucksack.repeated_item/1)
    |> Enum.map(&convert_priority/1)
    |> Enum.sum()
  end

  def convert_priority(<<character::utf8>>) when character > 96,
    do: character - 96

  def convert_priority(<<character::utf8>>),
    do: character - 38
end
