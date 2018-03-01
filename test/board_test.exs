defmodule BoardTest do
  use ExUnit.Case

  test "create an empty board" do
    assert Board.empty_board() == [nil, nil, nil, nil, nil, nil, nil, nil, nil]
  end

  test "mark a cell with a player's symbol" do
    marked_board = Board.insert_symbol([nil, nil, nil, nil, nil, nil, nil, nil, nil], 1, "X")
    assert marked_board == [nil, "X", nil, nil, nil, nil, nil, nil, nil]
  end

  test "mark two cells with different players' symbol" do
    marked_board = Board.empty_board()
            |> Board.insert_symbol(0, :player_one)
            |> Board.insert_symbol(1, :player_two)
    assert marked_board == [:player_one, :player_two, nil, nil, nil, nil, nil, nil, nil]
  end

  # test "return the index of all empty cells on a board" do
  #   board = Board.empty_board()
  #           |> Board.insert_symbol(0, :player_one)
  #           |> Board.insert_symbol(1, :player_two)
  #           |> Board.insert_symbol(2, :player_one)
  #           |> Board.insert_symbol(3, :player_two)
  #   assert Board.empty_cells(board) == [4,5,6,7,8]
  # end
end
