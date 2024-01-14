require_relative 'domain/board/board_factory'
require_relative 'domain/players/human_player'
require_relative 'domain/players/player_factory'

require_relative 'ui/console_interface'
require_relative 'ui/board_display'
require_relative 'ui/cursor'

# Domain
player_factory = PlayerFactory.new(8)
player1 = player_factory.create_player(:white, "Player1")
player2 = player_factory.create_player(:red, "Player2")
board_factory = BoardFactory.new(8)
board = board_factory.create_chess_board(player1, player2)

# Ui
board_display = BoardDisplay.new
cursor = Cursor.new([0,0], board)
console_interface = ConsoleInterface.new(board_display, board, cursor)
console_interface.start