require_relative '../move-modules/slideable'

class RookPiece < Piece
  include Slideable

  def initialize(color)
    super(color)
  end

  def valid_move?(start_position, end_position)
  end

  def move_offset
    [[0,1], [0,-1], [1,0], [-1,0]]
  end

  def symbol
    :R
  end
end
