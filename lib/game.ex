defmodule Game do
  def play(board, players) do
    if Rules.game_in_progress?(board) do
      cell_index = EasyAI.cell_selection(board)
      current_player = Enum.at(players, 0)
      new_board = board |> move(cell_index, current_player)
      
      play(new_board, Enum.reverse(players))
    else
      board
    end
  end

  def move(board, cell, player) do
    Board.insert_symbol(board, cell, player)
  end
end
