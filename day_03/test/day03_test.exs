defmodule Day03Test do
  use ExUnit.Case
  doctest Day03

  alias Rucksack

  @base_test """
    vJrwpWtwJgWrhcsFMMfFFhFp
    jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
    PmmdzqPrVvPwwTWBwg
    wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
    ttgJtRGJQctTZtZT
    CrZsJsPPZsGzwwsLwLmpwMDw
  """

  test "split original input line" do
    input_line = "vJrwpWtwJgWrhcsFMMfFFhFp"

    assert %Rucksack{first: "vJrwpWtwJgWr", second: "hcsFMMfFFhFp"} ==
             Rucksack.from_string(input_line)
  end

  test "finds repeated elements" do
    rucksack = %Rucksack{first: "vJrwpWtwJgWr", second: "hcsFMMfFFhFp"}

    assert "p" == Rucksack.repeated_item(rucksack)
  end
end
