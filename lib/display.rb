require 'colorize'
require_relative 'cursor'

class Display
    attr_reader :cursor

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0, 0], board)
    end

    def render
        system('clear')
        (0..7).each do |row|
            (0..7).each do |column|
                pos = [row, column]
                piece = @board[pos]
                piece_color = ((piece.nil?) ? :white : piece.color)
                display_code = ((piece.nil?) ? '  ' : piece.symbol)

                background = case
                when @cursor.selected && @cursor.cursor_pos == pos
                    :selected
                when @cursor.cursor_pos == pos
                    :cursor_here
                when (row + column).odd?
                    :dark
                when (row + column).even?
                    :light
                end

                case
                when piece_color == :white && background == :selected
                    print display_code.white.on_blue
                when piece_color == :white && background == :cursor_here
                    print display_code.white.on_green
                when piece_color == :white && background == :dark
                    print display_code.white.on_magenta
                when piece_color == :white && background == :light
                    print display_code.white.on_light_magenta
                when piece_color == :black && background == :selected
                    print display_code.black.on_blue
                when piece_color == :black && background == :cursor_here
                    print display_code.black.on_green
                when piece_color == :black && background == :dark
                    print display_code.black.on_magenta
                when piece_color == :black && background == :light
                    print display_code.black.on_light_magenta
                end
            end
            puts ''
        end
    end
end
