defmodule HumanPlayerTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "cell_selection() returns the correct integer from player's input" do
    capture_io([input: "1\n"], fn ->
      assert HumanPlayer.cell_selection() == 1
    end)
  end
end
