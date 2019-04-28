require_relative 'board'
require_relative 'display'
require_relative 'human_player'

class Game
    def initialize
        @board = Board.new
        @display = Display.new(@board)
        @player1 = HumanPlayer.new(@board, @display)
        @player2 = HumanPlayer.new(@board, @display)
    end

    def play
        until @board.won?
            @display.render
            puts "Player 1, make your move"
            @player1.make_move

            @display.render
            puts "Player 2, make your move"
            @player2.make_move
        end
    end
end

game = Game.new
game.play
