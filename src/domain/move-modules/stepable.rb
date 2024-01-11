module Stepable
  def get_all_moves(offset, current_position)
    row, column = *current_position
    positions = []

    offset.each do |move|
      new_row = move[0] + row
      new_column = move[1] + column

      if new_row >= 0 && new_row <= 7 && new_column >= 0 && new_column <= 7
        positions << [new_row, new_column]
      end
    end

    positions
  end
end