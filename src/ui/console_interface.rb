class ConsoleInterface
  def initialize(board_display, board)
    @board_display = board_display
    @board = board
  end

  def start
    @board_display.show_board(@board)
  end
end
