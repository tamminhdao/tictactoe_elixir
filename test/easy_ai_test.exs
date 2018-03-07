defmodule EasyAITest do
  use ExUnit.Case

  test "easy AI takes the first available cell on an empty board" do
    board = Board.empty_board()
    new_board = EasyAI.make_move(board, :AI)
    assert new_board == [:AI, :empty, :empty, :empty, :empty, :empty, :empty, :empty, :empty]
  end

  test "easy AI takes the first available cell on a half marked board" do
    board = Board.empty_board()
          |> Board.insert_symbol(0, :player_one)
          |> Board.insert_symbol(1, :player_two)
    new_board = EasyAI.make_move(board, :AI)
    assert new_board == [:player_one, :player_two, :AI, :empty, :empty, :empty, :empty, :empty, :empty]
  end

end
