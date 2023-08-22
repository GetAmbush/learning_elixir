defmodule ItemSet do
  def repeated_item(mapsets) when is_list(mapsets) do
    mapsets
    |> Enum.reduce(fn element, acc -> MapSet.intersection(element, acc) end)
    |> Enum.to_list()
    |> Enum.at(0)
  end
end
