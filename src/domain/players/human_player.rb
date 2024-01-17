class HumanPlayer
  attr_reader :color, :pieces, :king_piece

  def initialize(color, name, pieces, king_piece)
    @king_piece = king_piece
    @color = color
    @name = name
    @pieces = pieces
  end

  def pieces_can_move_to(board, position)
    pieces = all_pieces

    pieces.any? do |piece|
      piece.can_move_to?(board, position)
    end
  end

  def not_available_moves(board)
    pieces = all_pieces

    pieces.all? do |piece|
      valid_moves = piece.valid_moves(board)
      valid_moves.empty?
    end
  end

  def all_pieces
    @pieces.flatten
  end

  def dup
    pieces = @pieces.map { |row_piece| row_piece.dup}
    king_piece = pieces[0][3]
    HumanPlayer.new(@color, @name, pieces, king_piece)
  end

  def change_king_position(end_position)
    @king_piece.position = end_position
  end
end
