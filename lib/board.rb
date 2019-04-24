require_relative 'piece'

class Board
    attr_reader :rows

    def initialize
        @rows = Array.new(8) { Array.new(8) }
        setup_board
    end

    def move_piece(start_pos, end_pos)
        start_row, start_column = start_pos
        end_row, end_column = end_pos

        piece_to_move = @rows[start_row][start_column]
        raise('No piece at start_pos') if piece_to_move.nil?

        piece_to_move.pos = end_pos
        @rows[end_row][end_column] = piece_to_move
        @rows[start_row][start_column] = nil
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
