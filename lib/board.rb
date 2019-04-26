require_relative 'piece'

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
        (0..7).each do |column|
            @rows[0][column] = Piece.new(:black, self, [0, column])
            @rows[1][column] = Piece.new(:black, self, [1, column])
            @rows[6][column] = Piece.new(:white, self, [6, column])
            @rows[7][column] = Piece.new(:white, self, [7, column])
        end
    end
end
