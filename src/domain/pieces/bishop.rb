require_relative '../move-modules/slideable'

class Bishop < Piece
  include Slideable

  def initialize(color)
    super(color)
  end

  def move_offset
    [[-1,-1], [-1,1], [1,1], [1, -1]]
  end
end
