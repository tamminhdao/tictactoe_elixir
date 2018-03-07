defmodule GameTest do
  use ExUnit.Case

  test "make the correct moves" do
    board = Board.empty_board()
            |> Game.move(0, :X)
            |> Game.move(1, :O)
    assert board == [:X, :O, :empty, :empty, :empty, :empty, :empty, :empty, :empty]
  end

  describe "a game between 2 easy AIs" do
    test "after one move, the board has the first player's mark on cell 0" do
      board = Board.empty_board()
      new_board = Game.play(board, :X, :O)
      assert new_board == [:X, :empty, :empty, :empty, :empty, :empty, :empty, :empty, :empty]
    end

  #   test "ends with the first AI winning by the top right to bottom left diagonal" do
  #     board = Board.empty_board()
  #     winning_board = Game.play(board, :X, :O)
  #     assert winning_board == [:X, :O, :X, :O, :X, :O, :X, :empty, :empty]
  #   end
  end
end
