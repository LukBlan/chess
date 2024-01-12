require_relative 'domain/board/board_factory'
require_relative 'domain/players/human_player'
require_relative 'ui/console_interface'
require_relative 'ui/board_display'

# Domain
player1 = HumanPlayer.new(:white, "Player1")
player2 = HumanPlayer.new(:red, "Player2")
board_factory = BoardFactory.new
board = board_factory.create_chess_board(player1, player2)

# Ui
board_display = BoardDisplay.new
console_interface = ConsoleInterface.new(board_display, board)
console_interface.start