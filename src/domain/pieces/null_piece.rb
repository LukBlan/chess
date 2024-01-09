require_relative 'piece'
require_relative '../errors/not_piece_on_location'

class NullPiece < Piece
  def initialize(color)
    super(color)
  end

  def valid_move?(start_position, end_position)
    raise NotPieceOnLocation.new("There is not piece in target location")
  end
end
