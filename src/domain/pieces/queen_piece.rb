require_relative '../move-modules/slideable'

class QueenPiece < Piece
  include Slideable

  def initialize(color)
    super(color)
  end

  def valid_move?(start_position, end_position)
  end

  def move_offset
    [[0,-1], [-1,1], [1,0], [1,1], [0,1], [-1,1], [-1,0], [-1,-1]]
  end
end
