defmodule Day03Test do
  use ExUnit.Case
  doctest Day03

  describe "convert_priority/1" do
    test "works for upper case characters" do
      assert Day03.convert_priority("A") == 27
    end
  end
end
