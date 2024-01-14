class Board
  ROW_SIZE = 8
  COLUMN_SIZE = 8
  attr_reader :grid

  def initialize(grid, null_piece_color, players)
    @players = players
    @grid = grid
    @null_piece_color = null_piece_color
  end

  def in_check?(color)
    player = get_player_by_color(color)
    enemy_player = get_enemy_player(color)
    player_king = player.king_piece
    king_position = player_king.position
    enemy_player.pieces_can_move_to(self, king_position)
  end

  def get_player_by_color(color)
    @players.find { |player| player.color == color }
  end

  def get_enemy_player(color)
    @players.find { |player| player.color != color }
  end

  def move_piece(start_position, end_position)
    start_row, start_column = *start_position
    end_row, end_column = *end_position
    @grid[start_row][start_column], @grid[end_row][end_column] = @grid[end_row][end_column], @grid[start_row][start_column]
    piece = get_piece(end_position)
    piece.position = end_position
  end

  def possible_moves(start_position)
    piece = get_piece(start_position)
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

  def get_valid_position(cursor_pos, diff)
    row, column = *cursor_pos
    diff_row, diff_column = *diff
    new_row = (row + diff_row) % ROW_SIZE
    new_column =  (column + diff_column) % COLUMN_SIZE
    [new_row, new_column]
  end

end
