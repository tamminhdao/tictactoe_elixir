defmodule HumanPlayer do

  def cell_selection(_) do
    cell = IO.gets "please enter your cell selection\n"
    validated_cell = cell |> Validator.validate_cell_selection()

    case validated_cell do
      :error -> cell_selection(:place_holder)
        _ -> validated_cell
    end
  end

end
