module Slideable
  def get_all_moves(offset, current_positions)
    positions = []

    offset.each do |move|
      row, column = *current_positions

      loop do
        row += move[0]
        column += move[1]

        if row < 0 || row >= 8 || column < 0 || column >= 8
          break
        end

        positions << [row, column]
      end
    end

    positions
  end
end