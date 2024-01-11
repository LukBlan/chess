class Piece
  ABSTRACT_ERROR_MESSAGE = "This is a abstract class"
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def valid_move?(start_position, end_position)
    raise StandardError(ABSTRACT_ERROR_MESSAGE)
  end

  def all_moves(current_position)
    offset = move_offset
    get_all_directional_moves(offset, current_position)
  end

  def valid_moves(board, current_position)
    all_piece_moves = all_moves(current_position)
    moves = []

    all_piece_moves.each do |direction|
      direction.each do |move|
        if board.blocked_move?(current_position, move)
          break
        end

        moves << move
      end
    end

    moves
  end
end
