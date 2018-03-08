defmodule Validator do
  def validate_cell_selection(input) do
    input |> validate_type() |> validate_range
  end

  defp validate_type(input) do
    case Integer.parse(input) do
      {cell, _} -> cell
      _ -> :error
    end
  end

  defp validate_range(input) do
    max_index = Board.default_board_size - 1
    within_range = Enum.member?(0..max_index, input)
    case within_range do
      false -> :error
      true -> input
    end
  end
end
