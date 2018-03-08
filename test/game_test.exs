defmodule GameTest do
  use ExUnit.Case

  test "if there is a win, the game stops" do
    board = Board.empty_board
            |> Board.insert_symbol(0, :X)
            |> Board.insert_symbol(1, :X)
            |> Board.insert_symbol(2, :X)
    final_board = Game.play(board, [EasyAI, EasyAI], [:X, :O])
    assert final_board == board
  end

  describe "a game between 2 easy AIs" do
    test "ends with the first AI winning by the top right to bottom left diagonal" do
      board = Board.empty_board()
      winning_board = Game.play(board, [EasyAI, EasyAI], [:X, :O])
      assert winning_board == [:X, :O, :X, :O, :X, :O, :X, :empty, :empty]
    end
  end
end
