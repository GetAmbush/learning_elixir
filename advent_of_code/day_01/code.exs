"input.txt"
|> File.stream!()
|> Stream.chunk_by(&(&1 == "\n"))
|> Stream.reject(fn elf -> elf == ["\n"] end)
|> Stream.map(fn elf ->
  elf
  |> Stream.map(fn calorie ->
    [num | _] = String.split(calorie, "\n")
    num
  end)
  |> Stream.map(&String.to_integer/1)
  |> Enum.sum()
end)
|> Enum.sort(:desc)
|> Enum.take(3)
|> Enum.sum()
|> dbg()
