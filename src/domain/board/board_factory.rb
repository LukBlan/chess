require_relative '../pieces/null_piece'
require_relative '../pieces/pawn_piece'
require_relative '../pieces/knight_king_piece'
require_relative '../pieces/rook_bishop_queen_piece'

class BoardFactory
  ROW_SIZE = 8
  COLUMN_SIZE = 8

  def initialize
    @grid = Array.new(ROW_SIZE) { [] }
  end

  def create_chess_board(player1, player2)
    fill_with_first_row_pieces(0, player1)
    fill_row_with_pawns(1, player1)
    fill_row_with_null_pieces(2..5)
    fill_row_with_pawns(6, player2)
    fill_with_first_row_pieces(7, player2)
    @grid
  end

  def fill_with_first_row_pieces(row, player_owner)
    color = player_owner.color

    @grid[row] << RookBishopQueenPiece.new(color)
    @grid[row] << KnightKingPiece.new(color)
    @grid[row] << RookBishopQueenPiece.new(color)
    @grid[row] << KnightKingPiece.new(color)
    @grid[row] << RookBishopQueenPiece.new(color)
    @grid[row] << RookBishopQueenPiece.new(color)
    @grid[row] << KnightKingPiece.new(color)
    @grid[row] << RookBishopQueenPiece.new(color)
  end

  def fill_row_with_null_pieces(range)
    null_piece_color = :grey

    (range).each do |index|
      COLUMN_SIZE.times { @grid[index] << NullPiece.new(null_piece_color) }
    end
  end

  def fill_row_with_pawns(row, player_owner)
    color = player_owner.color

    COLUMN_SIZE.times do
      @grid[row] << PawnPiece.new(color)
    end
  end
end
