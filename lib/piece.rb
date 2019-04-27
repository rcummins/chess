class Piece
    attr_reader :color, :pos
    attr_accessor :board

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
        symbol
    end

    def valid_moves
        moves.reject { |end_pos| in_check_after_move?(end_pos) }
    end

    def pos=(new_pos)
        raise 'Invalid position' unless new_pos.is_a?(Array)
        raise 'Invalid position' unless new_pos.length == 2
        raise 'Invalid position' unless new_pos.all? { |i| i.between?(0, 7) }

        @pos = new_pos
    end

    def symbol
        'X '
    end

    def inspect
        "#{@color} #{self.class} #{@pos}"
    end

    private

    def in_check_after_move?(end_pos)
        duped_board = @board.deep_dup
        duped_board.move_piece_without_validating(@pos, end_pos)

        return duped_board.in_check?(@color)
    end
end
