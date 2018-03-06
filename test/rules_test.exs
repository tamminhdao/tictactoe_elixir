defmodule RulesTest do
  use ExUnit.Case

    test "there is no win if the board is completely empty" do
      empty_board = Board.empty_board()
      assert Rules.win?(empty_board) == false
    end

    test "it's not a draw if the board is completely empty" do
      empty_board = Board.empty_board()
      assert Rules.draw?(empty_board) == false
    end

    test "game is in progress if the board is empty" do
      empty_board = Board.empty_board()
      assert Rules.game_in_progress?(empty_board) == true
    end

    test "game is in progress if there is not yet a win or a draw" do
      marked_board = Board.empty_board()
                    |> Board.insert_symbol(2, :player_one)
                    |> Board.insert_symbol(5, :player_two)
                    |> Board.insert_symbol(6, :player_one)
      assert Rules.game_in_progress?(marked_board) == true
    end

    test "winning at the top row" do
      winning_board = Board.empty_board()
                      |> Board.insert_symbol(0, :player_one)
                      |> Board.insert_symbol(1, :player_one)
                      |> Board.insert_symbol(2, :player_one)
      assert Rules.win?(winning_board) == true
      assert Rules.draw?(winning_board) == false
      assert Rules.game_in_progress?(winning_board) == false
    end

    test "winning at the middle row" do
      winning_board = Board.empty_board()
                      |> Board.insert_symbol(3, :player_one)
                      |> Board.insert_symbol(4, :player_one)
                      |> Board.insert_symbol(5, :player_one)
      assert Rules.win?(winning_board) == true
      assert Rules.draw?(winning_board) == false
      assert Rules.game_in_progress?(winning_board) == false
    end

    test "winning at the bottom row" do
      winning_board = Board.empty_board()
                      |> Board.insert_symbol(6, :player_one)
                      |> Board.insert_symbol(7, :player_one)
                      |> Board.insert_symbol(8, :player_one)
      assert Rules.win?(winning_board) == true
      assert Rules.draw?(winning_board) == false
      assert Rules.game_in_progress?(winning_board) == false
    end

    test "winning at the left column" do
      winning_board = Board.empty_board()
                      |> Board.insert_symbol(0, :player_one)
                      |> Board.insert_symbol(3, :player_one)
                      |> Board.insert_symbol(6, :player_one)
      assert Rules.win?(winning_board) == true
      assert Rules.draw?(winning_board) == false
      assert Rules.game_in_progress?(winning_board) == false
    end

    test "winning at the middle column" do
      winning_board = Board.empty_board()
                      |> Board.insert_symbol(1, :player_one)
                      |> Board.insert_symbol(4, :player_one)
                      |> Board.insert_symbol(7, :player_one)
      assert Rules.win?(winning_board) == true
      assert Rules.draw?(winning_board) == false
      assert Rules.game_in_progress?(winning_board) == false
    end

    test "winning at the right column" do
      winning_board = Board.empty_board()
                      |> Board.insert_symbol(2, :player_one)
                      |> Board.insert_symbol(5, :player_one)
                      |> Board.insert_symbol(8, :player_one)
      assert Rules.win?(winning_board) == true
      assert Rules.draw?(winning_board) == false
      assert Rules.game_in_progress?(winning_board) == false
    end

    test "winning by diagonal top left to bottom right" do
      winning_board = Board.empty_board()
                      |> Board.insert_symbol(0, :player_one)
                      |> Board.insert_symbol(4, :player_one)
                      |> Board.insert_symbol(8, :player_one)
      assert Rules.win?(winning_board) == true
      assert Rules.draw?(winning_board) == false
      assert Rules.game_in_progress?(winning_board) == false
    end

    test "winning by diagonal top right to bottom left" do
      winning_board = Board.empty_board()
                      |> Board.insert_symbol(2, :player_one)
                      |> Board.insert_symbol(4, :player_one)
                      |> Board.insert_symbol(6, :player_one)
      assert Rules.win?(winning_board) == true
      assert Rules.draw?(winning_board) == false
      assert Rules.game_in_progress?(winning_board) == false
    end

    test "the board recognizes a draw" do
      tie_board = Board.empty_board()
                    |> Board.insert_symbol(0, :player_one)
                    |> Board.insert_symbol(1, :player_two)
                    |> Board.insert_symbol(2, :player_one)
                    |> Board.insert_symbol(4, :player_two)
                    |> Board.insert_symbol(3, :player_one)
                    |> Board.insert_symbol(5, :player_two)
                    |> Board.insert_symbol(7, :player_one)
                    |> Board.insert_symbol(6, :player_two)
                    |> Board.insert_symbol(8, :player_one)
      assert Rules.win?(tie_board) == nil
      assert Rules.draw?(tie_board) == true
      assert Rules.game_in_progress?(tie_board) == false
    end

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
