class Piece
  ABSTRACT_ERROR_MESSAGE = "This is a abstract class"

  def initialize(color)
    @color = color
  end

  def valid_move?(start_position, end_position)
    raise StandardError(ABSTRACT_ERROR_MESSAGE)
  end

  def all_moves(current_position)
    offset = move_offset
    get_all_moves(offset, current_position)
  end
end
