class HumanPlayer
    def initialize(display)
        @display = display
    end

    def make_move
        input = @display.cursor.get_input
    end
end