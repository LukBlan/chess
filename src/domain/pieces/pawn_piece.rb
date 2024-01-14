require_relative 'piece'
require_relative '../move-modules/stepable'

class PawnPiece < Piece
  include Stepable

  def initialize(color)
    super(color)
  end

  def valid_move?(start_position, end_position)
  end

  def symbol
    :P
  end

  def move_offset
    [[1,0]]
  end
end
