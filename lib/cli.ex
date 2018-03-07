defmodule CLI do

  def display_board(board) do
    Enum.with_index(board)
    |> Enum.map(fn(x) -> status_to_display(x) end)
    |> IO.write()
  end

  defp status_to_display({status, index}) do
    case status do
      :empty -> " #{index} "
      _ -> " #{status} "
    end
  end
end
