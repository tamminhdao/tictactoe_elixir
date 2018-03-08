defmodule ValidatorTest do
  use ExUnit.Case

  test "returns the number if the input is a valid integer" do
    assert Validator.validate_cell_selection("8") == 8
  end

  describe "the input starts with an integer but has trailing text" do
    test "returns the number and trims the trailing text" do
      assert Validator.validate_cell_selection("0^%&*") == 0
    end
  end

  test "returns :error is the input does not start with an integer" do
    assert Validator.validate_cell_selection("fsd9lhjiu") == :error
  end

  test "returns :error is the input is empty" do
    assert Validator.validate_cell_selection("") == :error
  end

  test "returns :error is the input is a new line" do
    assert Validator.validate_cell_selection("\n") == :error
  end

  test "integer cannot be negative" do
    assert Validator.validate_cell_selection("-10") == :error
  end

  test "cell input cannot be a number larger than the board size" do
    assert Validator.validate_cell_selection("10") == :error
  end
end
