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
    assert Board.empty_cell(board, 0) == true
    assert Board.empty_cell(board, 1) == false
  end
end
