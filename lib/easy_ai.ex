defmodule EasyAI do
  def cell_selection(board) do
    Enum.find_index(board, fn(x) -> x == :empty end)
  end
end
