require_relative '../pieces/null_piece'
require_relative '../pieces/pawn_piece'
require_relative '../pieces/knight_piece'
require_relative '../pieces/queen_piece'
require_relative '../pieces/rook_piece'
require_relative '../pieces/bishop'
require_relative '../pieces/king_piece'
require_relative 'board'

class BoardFactory
  ROW_SIZE = 8
  COLUMN_SIZE = 8

  def initialize
    @grid = Array.new(ROW_SIZE) { [] }
    @null_piece = NullPiece.instance
  end

  def create_chess_board(player1, player2)
    fill_with_first_row_pieces(7, player1)
    fill_row_with_pawns(6, player1)
    fill_row_with_null_pieces(2..5)
    fill_row_with_pawns(1, player2)
    fill_with_first_row_pieces(0, player2)
    Board.new(@grid, @null_piece.color)
  end

  def fill_with_first_row_pieces(row, player_owner)
    color = player_owner.color

    @grid[row] << RookPiece.new(color)
    @grid[row] << KnightPiece.new(color)
    @grid[row] << Bishop.new(color)
    @grid[row] << KingPiece.new(color)
    @grid[row] << QueenPiece.new(color)
    @grid[row] << Bishop.new(color)
    @grid[row] << KnightPiece.new(color)
    @grid[row] << RookPiece.new(color)
  end

  def fill_row_with_null_pieces(range)
    (range).each do |index|
      COLUMN_SIZE.times { @grid[index] << @null_piece }
    end
  end

  def fill_row_with_pawns(row, player_owner)
    color = player_owner.color

    COLUMN_SIZE.times do
      @grid[row] << PawnPiece.new(color)
    end
  end
end
