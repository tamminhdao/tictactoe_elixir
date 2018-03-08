defmodule Game do
  def play(board, players, symbols) do
    if Rules.game_in_progress?(board) do
      current_player = Enum.at(players, 0)
      current_player_symbol = Enum.at(symbols, 0)

      cell_index = current_player.cell_selection(board)
      new_board = board |> move(cell_index, current_player_symbol)

      play(new_board, Enum.reverse(players), Enum.reverse(symbols))
    else
      board
    end
  end

  def move(board, cell, player_symbol) do
    Board.insert_symbol(board, cell, player_symbol)
  end
end
