require_relative 'rook'
require_relative 'knight'
require_relative 'bishop'
require_relative 'queen'
require_relative 'king'
require_relative 'pawn'

class Board
    attr_accessor :rows

    def initialize
        @rows = Array.new(8) { Array.new(8) }
        setup_board
    end

    def [](pos)
        row, column = pos
        return @rows[row][column]
    end

    def []=(pos, new_value)
        row, column = pos
        @rows[row][column] = new_value
    end

    def move_piece(start_pos, end_pos)
        piece_to_move = self[start_pos]
        raise('No piece at start_pos') if piece_to_move.nil?

        piece_to_move.pos = end_pos
        self[end_pos] = piece_to_move
        self[start_pos] = nil
    end

    def valid_pos?(pos)
        pos.all? { |index| index.between?(0, 7) }
    end

    private

    def setup_board
        @rows[0][0] = Rook.new(  :black, self, [0, 0])
        @rows[0][1] = Knight.new(:black, self, [0, 1])
        @rows[0][2] = Bishop.new(:black, self, [0, 2])
        @rows[0][3] = Queen.new( :black, self, [0, 3])
        @rows[0][4] = King.new(  :black, self, [0, 4])
        @rows[0][5] = Bishop.new(:black, self, [0, 5])
        @rows[0][6] = Knight.new(:black, self, [0, 6])
        @rows[0][7] = Rook.new(  :black, self, [0, 7])
        @rows[7][0] = Rook.new(  :white, self, [7, 0])
        @rows[7][1] = Knight.new(:white, self, [7, 1])
        @rows[7][2] = Bishop.new(:white, self, [7, 2])
        @rows[7][3] = Queen.new( :white, self, [7, 3])
        @rows[7][4] = King.new(  :white, self, [7, 4])
        @rows[7][5] = Bishop.new(:white, self, [7, 5])
        @rows[7][6] = Knight.new(:white, self, [7, 6])
        @rows[7][7] = Rook.new(  :white, self, [7, 7])

        (0..7).each do |column|
            @rows[1][column] = Pawn.new(:black, self, [1, column])
            @rows[6][column] = Pawn.new(:white, self, [6, column])
        end
    end
end
