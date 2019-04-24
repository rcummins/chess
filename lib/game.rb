require_relative 'board'
require_relative 'display'

class Game
    def initialize
        @board = Board.new
        @display = Display.new(@board)
    end

    def test_movement
        while true
            @display.render
            @display.cursor.get_input
        end
    end
end

game = Game.new
game.test_movement