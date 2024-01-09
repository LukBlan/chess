class Piece
  def initialize(color)
    @color = color
  end

  def valid_move?(start_position, end_position)
    raise StandardError("This is a abstract class")
  end
end
