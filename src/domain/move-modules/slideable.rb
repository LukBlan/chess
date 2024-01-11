module Slideable
  def get_all_directional_moves(offset, current_positions)
    all_directional_moves = offset.map do |move|
      row, column = *current_positions
      direction_moves = []

      loop do
        row += move[0]
        column += move[1]

        if row < 0 || row >= 8 || column < 0 || column >= 8
          break
        end

        direction_moves << [row, column]
      end

      direction_moves
    end

    all_directional_moves.filter { |move| !move.empty?}
  end
end