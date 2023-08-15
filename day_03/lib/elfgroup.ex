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
    first_mapset = Rucksack.items(elf_group.rucksack1) |> String.graphemes() |> MapSet.new()
    second_mapset = Rucksack.items(elf_group.rucksack2) |> String.graphemes() |> MapSet.new()
    third_mapset = Rucksack.items(elf_group.rucksack3) |> String.graphemes() |> MapSet.new()

    first_mapset
    |> MapSet.intersection(second_mapset)
    |> MapSet.intersection(third_mapset)
    |> Enum.to_list()
    |> Enum.at(0)
  end
end
