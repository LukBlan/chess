require_relative 'domain/board/board_factory'
require_relative 'domain/players/human_player'

player1 = HumanPlayer.new(:white, "Player1")
player2 = HumanPlayer.new(:black, "Player2")
board_factory = BoardFactory.new
board = board_factory.create_chess_board(player1, player2)
p board.move_piece([0,7], [2,0])
