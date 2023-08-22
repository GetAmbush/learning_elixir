defmodule ElfGroupTest do
  use ExUnit.Case
  doctest Day03

  test "converts from list of rucksacks" do
    first = %Rucksack{first: "a", second: "b"}
    second = %Rucksack{first: "c", second: "d"}
    third = %Rucksack{first: "e", second: "f"}

    assert %ElfGroup{rucksack1: ^first, rucksack2: ^second, rucksack3: ^third} =
             ElfGroup.from_rucksacks([first, second, third])
  end

  describe "badge/1" do
    test "finds badge in group" do
      elf_group = %ElfGroup{
        rucksack1: Rucksack.from_string("vJrwpWtwJgWrhcsFMMfFFhFp"),
        rucksack2: Rucksack.from_string("jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL"),
        rucksack3: Rucksack.from_string("PmmdzqPrVvPwwTWBwg")
      }

      assert ElfGroup.badge(elf_group) == "r"
    end

    test "finds badge in group 2" do
      elf_group = %ElfGroup{
        rucksack1: Rucksack.from_string("wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn"),
        rucksack2: Rucksack.from_string("ttgJtRGJQctTZtZT"),
        rucksack3: Rucksack.from_string("CrZsJsPPZsGzwwsLwLmpwMDw")
      }

      assert ElfGroup.badge(elf_group) == "Z"
    end
  end
end
