require_relative '../move-modules/stepable'

class KnightPiece < Piece
  include Stepable

  def initialize(color)
    super(color)
  end

  def valid_move?(start_position, end_position)
  end

  def move_offset
    [[-2,-1], [-2,1], [2,-1], [2, 1], [-1,-2], [1, -2], [-1,2], [1,2]]
  end

  def symbol
    :H
  end
end
