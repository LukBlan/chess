class Piece
  ABSTRACT_ERROR_MESSAGE = "This is a abstract class"
  attr_reader :color
  attr_accessor :position

  def initialize(color)
    @color = color
    @position = nil
  end

  def can_move_to?(board, position)
    all_valid_moves = moves(board, @position)
    all_valid_moves.include?(position)
  end

  def valid_move?(start_position, end_position)
    raise StandardError(ABSTRACT_ERROR_MESSAGE)
  end

  def moves(board, current_position)
    offset = move_offset
    all_piece_moves = get_all_directional_moves(offset, current_position)
    moves = []

    all_piece_moves.each do |direction|
      direction.each do |move|
        if board.blocked_move?(current_position, move)
          break
        end

        if board.eat_opponent_piece?(current_position, move)
          moves << move
          break
        end

        moves << move
      end
    end

    moves
  end

  def move_into_check?(board, end_position)
    dup_board = board.dup
    dup_board.move_piece(@position, end_position)
    dup_board.in_check?(@color)
  end

  def valid_moves(board)
    piece_moves = self.moves(board, @position)

    piece_moves.filter do |move|
      !move_into_check?(board, move)
    end
  end

  def change_position(player, end_position)
    @position = end_position
  end
end
