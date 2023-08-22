map_phase_1 = %{
  "A X" => 1 + 3,
  "A Y" => 2 + 6,
  "A Z" => 3,
  "B X" => 1,
  "B Y" => 2 + 3,
  "B Z" => 3 + 6,
  "C X" => 1 + 6,
  "C Y" => 2,
  "C Z" => 3 + 3
}

map_phase_2 = %{
  "A X" => 3,
  "A Y" => 1 + 3,
  "A Z" => 2 + 6,
  "B X" => 1,
  "B Y" => 2 + 3,
  "B Z" => 3 + 6,
  "C X" => 2,
  "C Y" => 3 + 3,
  "C Z" => 1 + 6
}

rock_paper_scissors = fn input, comparison_map ->
  input
  |> File.read!()
  |> String.split("\n", trim: true)
  |> Enum.map(fn line -> comparison_map[line] end)
  |> Enum.sum()
  |> IO.puts()
end

rock_paper_scissors.("input.txt", map_phase_1)
rock_paper_scissors.("input.txt", map_phase_2)
