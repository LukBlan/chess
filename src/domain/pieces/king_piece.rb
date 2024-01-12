class KingPiece < Piece
  include Stepable

  def initialize(color)
    super(color)
  end

  def move_offset
    [[0,-1], [-1,1], [1,0], [1,1], [0,1], [-1,1], [-1,0], [-1,-1]]
  end

  def symbol
    :K
  end
end
