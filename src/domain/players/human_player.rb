class HumanPlayer
  attr_reader :color, :pieces, :king_piece

  def initialize(color, name, pieces, king_piece)
    @king_piece = king_piece
    @color = color
    @name = name
    @pieces = pieces
  end

  def pieces_can_move_to(board, position)
    @pieces.flatten.any? do |piece|
      piece.can_move_to?(board, position)
    end
  end
end
