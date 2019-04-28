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
            begin
                @white.make_move
            rescue
                puts "Sorry, that was not a valid move. Please try again."
                retry
            end

            @display.render
            puts "Black, make your move"
            begin
                @black.make_move
            rescue
                puts "Sorry, that was not a valid move. Please try again"
                retry
            end
        end

        @display.render
        puts "#{@board.winner} won!"
    end
end

game = Game.new
game.play
