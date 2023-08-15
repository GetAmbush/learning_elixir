defmodule RucksackTest do
  use ExUnit.Case
  doctest Day03

  alias Rucksack

  @test_input ~S"""
  vJrwpWtwJgWrhcsFMMfFFhFp
  jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
  PmmdzqPrVvPwwTWBwg
  wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
  ttgJtRGJQctTZtZT
  CrZsJsPPZsGzwwsLwLmpwMDw
  """

  test "read base input" do
    result =
      @test_input
      |> String.split("\n", trim: true)
      |> Enum.map(&Rucksack.from_string/1)

    assert length(result) == 6

    assert result == [
             %Rucksack{first: "vJrwpWtwJgWr", second: "hcsFMMfFFhFp"},
             %Rucksack{first: "jqHRNqRjqzjGDLGL", second: "rsFMfFZSrLrFZsSL"},
             %Rucksack{first: "PmmdzqPrV", second: "vPwwTWBwg"},
             %Rucksack{first: "wMqvLMZHhHMvwLH", second: "jbvcjnnSBnvTQFn"},
             %Rucksack{first: "ttgJtRGJ", second: "QctTZtZT"},
             %Rucksack{first: "CrZsJsPPZsGz", second: "wwsLwLmpwMDw"}
           ]
  end

  test "finds repeated items" do
    rucksack_list = [
      %Rucksack{first: "vJrwpWtwJgWr", second: "hcsFMMfFFhFp"},
      %Rucksack{first: "jqHRNqRjqzjGDLGL", second: "rsFMfFZSrLrFZsSL"},
      %Rucksack{first: "PmmdzqPrV", second: "vPwwTWBwg"},
      %Rucksack{first: "wMqvLMZHhHMvwLH", second: "jbvcjnnSBnvTQFn"},
      %Rucksack{first: "ttgJtRGJ", second: "QctTZtZT"},
      %Rucksack{first: "CrZsJsPPZsGz", second: "wwsLwLmpwMDw"}
    ]

    result = Enum.map(rucksack_list, &Rucksack.repeated_item/1)

    assert length(result) == 6
    assert result == ["p", "L", "P", "v", "t", "s"]
  end

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
