require_relative '../move-modules/stepable'

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

  def change_position(player, end_position)
    super
    player.change_king_position(end_position)
  end
end
