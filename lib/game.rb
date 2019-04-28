require_relative 'board'
require_relative 'display'
require_relative 'human_player'

class Game
    def initialize
        @board = Board.new
        @display = Display.new(@board)
        @white = HumanPlayer.new(@board, @display)
        @black = HumanPlayer.new(@board, @display)
    end

    def play
        until @board.won?
            @display.render
            puts "White, make your move"
            @white.make_move

            @display.render
            puts "Black, make your move"
            @black.make_move
        end

        @display.render
        puts "#{@board.winner} won!"
    end
end

game = Game.new
game.play
