defmodule EasyAI do
  def make_move(board, symbol) do
    cell_index = Enum.find_index(board, fn(x) -> x == :empty end)
    Board.insert_symbol(board, cell_index, symbol)
  end
end
