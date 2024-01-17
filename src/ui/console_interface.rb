class ConsoleInterface
  def initialize(board_display, board, cursor)
    @board_display = board_display
    @board = board
    @cursor = cursor
  end

  def start
    @board.move_piece([6,2], [4,2])
    @board.move_piece([6,1], [4,1])
    @board.move_piece([0,4], [4,0])
    puts(@board.in_check?(:white))
    puts(@board.checkmate?(:white))
    #current_position = get_move_position
    #target_position = get_move_position
    #@board.move_piece(current_position, target_position)
    #@board_display.show_board(@board, @cursor)
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
