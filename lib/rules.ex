defmodule Rules do
  def winning_combos(board) do
    Enum.into(Board.row(board), Board.column(board))
    |> Enum.into(Board.diagonal(board))
  end

  def win?(board) do
    if board == Board.empty_board() do
      false
    else
      Enum.find_value(winning_combos(board), fn(x) -> identical(x) end)
    end
  end

  defp identical(enumerable) do
    Enum.uniq(enumerable) |> Kernel.length == 1
  end
end
