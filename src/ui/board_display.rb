require 'colorize'

class BoardDisplay
  def show_board(board, cursor)
    grid = board.grid
    grid.each_with_index do |row, row_index|
      show_row(row, row_index, cursor)
      puts
    end
  end

  def show_row(row, row_index, cursor)
    row.each_with_index do |piece, column_index|
      color = piece.color
      symbol = piece.symbol

      if cursor.cursor_pos == [row_index, column_index]
        color = :blue
      end

      print("#{symbol} ".colorize(color))
    end
  end
end
