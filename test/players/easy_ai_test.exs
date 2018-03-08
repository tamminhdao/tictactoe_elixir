defmodule EasyAITest do
  use ExUnit.Case

  test "easy AI takes the first available cell on an empty board" do
    board = Board.empty_board()
    cell_selection = EasyAI.cell_selection(board)
    assert cell_selection == 0
  end

  test "easy AI takes the first available cell on a half marked board" do
    board = Board.empty_board()
          |> Board.insert_symbol(0, :player_one)
          |> Board.insert_symbol(1, :player_two)
    cell_selection = EasyAI.cell_selection(board)
    assert cell_selection == 2
  end
end
