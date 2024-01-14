require_relative '../pieces/king_piece'
require_relative '../pieces/pawn_piece'
require_relative '../pieces/rook_piece'
require_relative '../pieces/queen_piece'
require_relative '../pieces/bishop'
require_relative '../pieces/knight_piece'

class PlayerFactory
  def initialize(number_of_pieces)
    @number_of_pieces = number_of_pieces
    @king_piece = nil
  end

  def create_player(color, name)
    pieces = create_pieces(color)
    HumanPlayer.new(color, name, pieces, @king_piece)
  end

  def create_pieces(color)
    pieces = []

    first_row_pieces = create_first_row_pieces(color)
    row_with_pawns = create_row_with_pawns(color)
    pieces << first_row_pieces
    pieces << row_with_pawns

    pieces
  end

  def create_first_row_pieces(color)
    first_row = []
    king_piece = KingPiece.new(color)

    first_row << RookPiece.new(color)
    first_row << KnightPiece.new(color)
    first_row << Bishop.new(color)
    first_row << king_piece
    first_row << QueenPiece.new(color)
    first_row << Bishop.new(color)
    first_row << KnightPiece.new(color)
    first_row << RookPiece.new(color)

    @king_piece = king_piece
    first_row
  end

  def create_row_with_pawns(color)
    pawns = []

    @number_of_pieces.times do
      pawns << PawnPiece.new(color)
    end

    pawns
  end
end
