defmodule HumanPlayerTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "cell_selection() returns the correct integer from player's input" do
    capture_io([input: "1\n"], fn ->
      assert HumanPlayer.cell_selection(:place_holder) == 1
    end)
  end

  test "cell_selection() returns the correct integer from player's input (scenario 2)" do
    capture_io([input: "1 89%$%}"], fn ->
      assert HumanPlayer.cell_selection(:place_holder) == 1
    end)
  end

end
