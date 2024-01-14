require_relative '../pieces/null_piece'
require_relative 'board'

class BoardFactory
  def initialize(board_size)
    @board_size = board_size
    @grid = Array.new(board_size) { [] }
    @null_piece = NullPiece.instance
    @kings = {}
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
    add_pieces(row_number, player_pieces[0])
    assign_pieces_position(row_number)
  end

  def add_pieces(row_number, pieces)
    pieces.each do |piece|
      @grid[row_number] << piece
    end
  end

  def assign_pieces_position(row_number)
    @board_size.times do |index|
      piece = @grid[row_number][index]
      piece.position = [row_number, index]
    end
  end

  def fill_row_with_null_pieces(range)
    (range).each do |index|
      @board_size.times { @grid[index] << @null_piece }
    end
  end

  def fill_row_with_pawns(row_number, player_owner)
    player_pieces = player_owner.pieces
    add_pieces(row_number, player_pieces[1])
    assign_pieces_position(row_number)
  end
end
