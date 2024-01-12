class ConsoleInterface
  def initialize(board_display, board, cursor)
    @board_display = board_display
    @board = board
    @cursor = cursor
  end

  def start
    loop do
      @board_display.show_board(@board, @cursor)
      result = @cursor.get_input

      system("clear")

      if result != nil
        break
      end
    end

    @board_display.show_board(@board, @cursor)
  end
end
