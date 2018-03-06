defmodule CLITest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "print empty board with indexes on the console" do
    empty_board = Board.empty_board()
    assert capture_io(fn ->
      CLI.display_board(empty_board)
    end) == " 0  1  2  3  4  5  6  7  8 "
  end

  test "print marked board on the console" do
    marked_board = Board.empty_board()
                  |> Board.insert_symbol(0, :player_one)
                  |> Board.insert_symbol(1, :player_two)
    assert capture_io(fn ->
      CLI.display_board(marked_board)
    end) == " X  O  2  3  4  5  6  7  8 "
  end
end
