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

  def empty_cell?(board, index) do
    cell_value(board, index) == :empty
  end

  def is_full?(board) do
    Enum.find(board, fn(x) -> x == :empty end) == nil
  end

  def row(board) do
    Enum.chunk_every(board,3)
  end

  def column(board) do
    [i0, i1, i2, i3, i4, i5, i6, i7, i8] = board
    [[i0, i3, i6], [i1, i4, i7], [i2, i5, i8]]
  end

  def diagonal(board) do
    [i0, _, i2, _, i4, _, i6, _, i8] = board
    [[i0, i4, i8], [i2, i4, i6]]
  end
end
