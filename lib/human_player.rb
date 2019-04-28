class HumanPlayer
    def initialize(board, display)
        @board = board
        @display = display
    end

    def make_move
        input = nil
        while input.nil?
            input = @display.cursor.get_input
            @display.render
        end
        start_pos = input

        input = nil
        while input.nil?
            input = @display.cursor.get_input
            @display.render
        end
        end_pos = input

        @board.move_piece(start_pos, end_pos)
    end
end
