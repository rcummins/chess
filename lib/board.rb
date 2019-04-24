require_relative 'piece'

class Board
    attr_reader :rows

    def initialize
        @rows = Array.new(8) { Array.new(8) }
        setup_board
    end

    private

    def setup_board
        (0..7).each do |column|
            @rows[0][column] = Piece.new(:white, self, [0, column])
            @rows[1][column] = Piece.new(:white, self, [1, column])
            @rows[6][column] = Piece.new(:black, self, [6, column])
            @rows[7][column] = Piece.new(:black, self, [7, column])
        end
    end
end