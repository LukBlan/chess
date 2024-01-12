require 'colorize'

class BoardDisplay
  def show_board(board)
    grid = board.grid
    grid.each do |row|
      show_row(row)
      puts
    end
  end

  def show_row(row)
    row.each do |piece|
      color = piece.color
      symbol = piece.symbol

      print("#{symbol} ".colorize(color))
    end
  end
end
