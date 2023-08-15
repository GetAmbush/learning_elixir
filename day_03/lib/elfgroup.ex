defmodule ElfGroup do
  defstruct [:rucksack1, :rucksack2, :rucksack3]

  def from_rucksacks([%Rucksack{} = first, %Rucksack{} = second, %Rucksack{} = third]) do
    %__MODULE__{
      rucksack1: first,
      rucksack2: second,
      rucksack3: third
    }
  end

  def badge(%ElfGroup{} = elf_group) do
    first_mapset = elf_group.rucksack1 |> Rucksack.items() |> String.graphemes() |> MapSet.new()
    second_mapset = elf_group.rucksack2 |> Rucksack.items() |> String.graphemes() |> MapSet.new()
    third_mapset = elf_group.rucksack3 |> Rucksack.items() |> String.graphemes() |> MapSet.new()

    ItemSet.repeated_item([first_mapset, second_mapset, third_mapset])
  end
end
