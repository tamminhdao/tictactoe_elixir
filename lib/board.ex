defmodule Board do
  def empty_board(dimension \\ 3) do
    Enum.to_list 0..(dimension*dimension - 1)
    |> Enum.map(fn(_) -> :empty end)
  end

  def insert_symbol(board, index, symbol) do
    List.replace_at(board, index, symbol)
  end

  def cell_value(board, index) do
    Enum.at(board, index)
  end

  def empty_cell(board, index) do
    cell_value(board, index) == :empty
  end
end
