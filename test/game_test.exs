defmodule GameTest do
  use ExUnit.Case

  test "make the correct moves" do
    board = Board.empty_board
            |> Game.move(0, :X)
            |> Game.move(1, :O)
    assert board == [:X, :O, :empty, :empty, :empty, :empty, :empty, :empty, :empty]
  end

  test "if there is a win, the game stops" do
    board = Board.empty_board
            |> Game.move(0, :X)
            |> Game.move(1, :X)
            |> Game.move(2, :X)
    final_board = Game.play(board, [:X, :O])
    assert final_board == board
  end

  describe "a game between 2 easy AIs" do
    test "ends with the first AI winning by the top right to bottom left diagonal" do
      board = Board.empty_board()
      winning_board = Game.play(board, [:X, :O])
      assert winning_board == [:X, :O, :X, :O, :X, :O, :X, :empty, :empty]
    end
  end
end
