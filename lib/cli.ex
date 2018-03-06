defmodule CLI do

  @player_one_symbol " X "
  @player_two_symbol " O "

  def display_board(board) do
    Enum.with_index(board)
    |> Enum.map(fn(x) -> status_to_display(x) end)
    |> IO.write()
  end

  defp status_to_display({status, index}) do
    case status do
      :player_one -> @player_one_symbol
      :player_two -> @player_two_symbol
      :empty -> " #{index} "
    end
  end
end
