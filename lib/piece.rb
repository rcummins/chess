class Piece
    attr_reader :color, :pos

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
        symbol
    end

    def pos=(new_pos)
        raise 'Invalid position' unless new_pos.is_a?(Array)
        raise 'Invalid position' unless new_pos.length == 2
        raise 'Invalid position' unless new_pos.all? { |i| i.between?(0, 7) }

        @pos = new_pos
    end

    def symbol
        'X'
    end
end
