defmodule RulesTest do
  use ExUnit.Case

    test "there is no win if the board is completely empty" do
      empty_board = Board.empty_board()
      assert Rules.win?(empty_board) == false
    end

    test "obtain all rows" do
      board = [0,1,2,3,4,5,6,7,8]
      assert Rules.row(board) == [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
    end

    test "obtain all columns" do
      board = [0,1,2,3,4,5,6,7,8]
      assert Rules.column(board) == [[0, 3, 6], [1, 4, 7], [2, 5, 8]]
    end

    test "obtain all diagonals" do
      board = [0,1,2,3,4,5,6,7,8]
      assert Rules.diagonal(board) == [[0, 4, 8], [2, 4, 6]]
    end

    # test "winning by row" do
    #   winning_board = Board.empty_board()
    #   |> Board.insert_symbol(0, :player_one)
    #   |> Board.insert_symbol(1, :player_one)
    #   |> Board.insert_symbol(2, :player_one)
    #   assert Rules.win?(winning_board) == true
    # end

    test "winning combos" do
      board = [0,1,2,3,4,5,6,7,8]
      assert Rules.winning_combos(board) == [
                                              [0, 4, 8],
                                              [2, 4, 6],
                                              [0, 3, 6],
                                              [1, 4, 7],
                                              [2, 5, 8],
                                              [0, 1, 2],
                                              [3, 4, 5],
                                              [6, 7, 8]
                                            ]
    end
end
