require_relative 'board'
require_relative 'display'
require_relative 'human_player'

class Game
    def initialize
        @board = Board.new
        @display = Display.new(@board)
        @player1 = HumanPlayer.new(@display)
        @player2 = HumanPlayer.new(@display)
    end

    def play
        while true
            @display.render
            @player1.make_move
            @display.render
            @player2.make_move
        end
    end
end

game = Game.new
game.play
