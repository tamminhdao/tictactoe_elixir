defmodule Rules do
  def winning_combos(board) do
    Enum.into(Board.row(board), Board.column(board))
    |> Enum.into(Board.diagonal(board))
  end

  def game_in_progress?(board) do
    (win?(board) == false && draw?(board) == false)
    || (win?(board) == nil && draw?(board) == false)
  end

  def win?(board) do
    if board == Board.empty_board() do
      false
    else
      Enum.find_value(winning_combos(board), fn(x) -> identical_player_symbol?(x) end)
    end
  end

  def draw?(board) do
    if board == Board.empty_board() do
      false
    else
      Enum.find(board, fn(x) -> x == :empty end) == nil
      && win?(board) == nil
    end
  end

  defp identical_player_symbol?(enumerable) do
    Enum.uniq(enumerable) |> Kernel.length == 1 && Enum.uniq(enumerable) != [:empty]
  end
end
