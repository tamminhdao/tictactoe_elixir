defmodule Game do
  def play(board, player_one, player_two) do
    cell_index = EasyAI.cell_selection(board)
    board |> move(cell_index, player_one)
  end

  def move(board, cell, player) do
    Board.insert_symbol(board, cell, player)
  end
end
