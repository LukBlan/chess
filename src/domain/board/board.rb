class Board
  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def move_piece(start_position, end_position)
    start_row, start_column = *start_position
    end_row, end_column = *end_position
    piece = @grid[start_row][end_column]
    piece.valid_move?(start_position, end_position)
    @grid[start_row][start_column], @grid[end_row][end_column] = @grid[end_row][end_column], @grid[start_row][start_column]
  end

end
