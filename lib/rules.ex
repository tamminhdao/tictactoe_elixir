defmodule Rules do
  def winning_combos(board) do
    Enum.into(row(board), column(board))
    |> Enum.into(diagonal(board))
  end

  def win?(board) do
    if board == Board.empty_board() do
      false
    end
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
