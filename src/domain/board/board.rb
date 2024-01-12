class Board
  attr_reader :grid

  def initialize(grid, null_piece_color)
    @grid = grid
    @null_piece_color = null_piece_color
  end

  def move_piece(start_position, end_position)
    start_row, start_column = *start_position
    end_row, end_column = *end_position
    #piece.valid_move?(start_position, end_position)
    @grid[start_row][start_column], @grid[end_row][end_column] = @grid[end_row][end_column], @grid[start_row][start_column]
  end

  def possible_moves(start_position)
    piece = get_piece(start_position)
    p piece.all_moves(start_position)
    p piece.valid_moves(self, start_position)
  end

  def get_piece(position)
    start_row, start_column = *position
    @grid[start_row][start_column]
  end

  def blocked_move?(current_position, target_position)
    piece_in_current_position = get_piece(current_position)
    piece_on_target_position = get_piece(target_position)
    piece_in_current_position.color == piece_on_target_position.color
  end

  def eat_opponent_piece?(current_position, target_position)
    piece_in_current_position = get_piece(current_position)
    piece_on_target_position = get_piece(target_position)
    piece_in_current_position.color != piece_on_target_position.color &&
      piece_on_target_position.color != @null_piece_color
  end

end
