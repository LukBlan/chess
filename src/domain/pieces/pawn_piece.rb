require_relative 'piece'

class PawnPiece < Piece
  def initialize(color)
    super(color)
  end

  def valid_move?(start_position, end_position)
  end

  def symbol
    :P
  end
end
