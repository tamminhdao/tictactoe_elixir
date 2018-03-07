defmodule BoardTest do
  use ExUnit.Case

  test "create an empty board" do
    assert Board.empty_board() == [:empty, :empty, :empty, :empty, :empty, :empty, :empty, :empty, :empty]
  end

  test "mark a cell with a player's symbol" do
    marked_board = Board.insert_symbol([:empty, :empty, :empty, :empty, :empty, :empty, :empty, :empty, :empty], 1, "X")
    assert marked_board == [:empty, "X", :empty, :empty, :empty, :empty, :empty, :empty, :empty]
  end

  test "mark two cells with different players' symbol" do
    marked_board = Board.empty_board()
            |> Board.insert_symbol(0, :player_one)
            |> Board.insert_symbol(1, :player_two)
    assert marked_board == [:player_one, :player_two, :empty, :empty, :empty, :empty, :empty, :empty, :empty]
  end

  test "return the correct value for a particular cell" do
    marked_board = Board.empty_board()
            |> Board.insert_symbol(0, :player_one)
            |> Board.insert_symbol(1, :player_two)
    assert Board.cell_value(marked_board, 0) == :player_one
    assert Board.cell_value(marked_board, 1) == :player_two
    assert Board.cell_value(marked_board, 2) == :empty
  end

  test "returns true if a cell is empty and false otherwise" do
    board = Board.empty_board() |> Board.insert_symbol(1, :player_two)
    assert Board.empty_cell?(board, 0) == true
    assert Board.empty_cell?(board, 1) == false
  end

  test "is_full?() returns false if the board is empty" do
    empty_board = Board.empty_board()
    assert Board.is_full?(empty_board) == false
  end

  test "is_full?() returns false if there are more than one empty cells on the board" do
    almost_full_board = Board.empty_board()
                  |> Board.insert_symbol(0, :player_one)
                  |> Board.insert_symbol(1, :player_two)
                  |> Board.insert_symbol(2, :player_one)
                  |> Board.insert_symbol(4, :player_two)
                  |> Board.insert_symbol(3, :player_one)
    assert Board.is_full?(almost_full_board) == false
  end

  test "is_full?() returns false if there is one empty cell on the board" do
    almost_full_board = Board.empty_board()
                  |> Board.insert_symbol(0, :player_one)
                  |> Board.insert_symbol(1, :player_two)
                  |> Board.insert_symbol(2, :player_one)
                  |> Board.insert_symbol(4, :player_two)
                  |> Board.insert_symbol(3, :player_one)
                  |> Board.insert_symbol(5, :player_two)
                  |> Board.insert_symbol(7, :player_one)
                  |> Board.insert_symbol(6, :player_two)
    assert Board.is_full?(almost_full_board) == false
  end

  test "is_full?() returns true if there is no more empty cell" do
    full_board = Board.empty_board()
                  |> Board.insert_symbol(0, :player_one)
                  |> Board.insert_symbol(1, :player_two)
                  |> Board.insert_symbol(2, :player_one)
                  |> Board.insert_symbol(4, :player_two)
                  |> Board.insert_symbol(3, :player_one)
                  |> Board.insert_symbol(5, :player_two)
                  |> Board.insert_symbol(7, :player_one)
                  |> Board.insert_symbol(6, :player_two)
                  |> Board.insert_symbol(8, :player_one)
    assert Board.is_full?(full_board) == true
  end

  test "obtain all rows" do
    board = [0,1,2,3,4,5,6,7,8]
    assert Board.row(board) == [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
  end

  test "obtain all columns" do
    board = [0,1,2,3,4,5,6,7,8]
    assert Board.column(board) == [[0, 3, 6], [1, 4, 7], [2, 5, 8]]
  end

  test "obtain all diagonals" do
    board = [0,1,2,3,4,5,6,7,8]
    assert Board.diagonal(board) == [[0, 4, 8], [2, 4, 6]]
  end
end
