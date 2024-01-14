require_relative '../pieces/null_piece'
require_relative 'board'

class BoardFactory
  def initialize(board_size)
    @board_size = board_size
    @grid = Array.new(board_size) { [] }
    @null_piece = NullPiece.instance
  end

  def create_chess_board(player1, player2)
    fill_with_first_row_pieces(7, player1)
    fill_row_with_pawns(6, player1)
    fill_row_with_null_pieces(2..5)
    fill_row_with_pawns(1, player2)
    fill_with_first_row_pieces(0, player2)
    Board.new(@grid, @null_piece.color, [player1, player2])
  end

  def fill_with_first_row_pieces(row_number, player_owner)
    player_pieces = player_owner.pieces
    @grid[row_number] = player_pieces[0]
  end

  def fill_row_with_null_pieces(range)
    (range).each do |index|
      @board_size.times { @grid[index] << @null_piece }
    end
  end

  def fill_row_with_pawns(row_number, player_owner)
    player_pieces = player_owner.pieces
    @grid[row_number] = player_pieces[1]
  end
end
