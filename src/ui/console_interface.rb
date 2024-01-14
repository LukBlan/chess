class ConsoleInterface
  def initialize(board_display, board, cursor)
    @board_display = board_display
    @board = board
    @cursor = cursor
  end

  def start
    current_position = get_move_position
    target_position = get_move_position
    @board.move_piece(current_position, target_position)
    @board_display.show_board(@board, @cursor)
  end

  private

  def get_move_position
    loop do
      @board_display.show_board(@board, @cursor)
      result = @cursor.get_input
      system("clear")

      if result != nil
        return result
      end
    end
  end
end
