defmodule HumanPlayer do

  def cell_selection(_) do
    cell = IO.gets "please enter your cell selection\n"
    cell |> String.trim |> String.to_integer
  end

end
