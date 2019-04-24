require 'colorize'
require_relative 'cursor'

class Display
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0, 0], board)
    end

    def render
        (0..7).reverse_each do |row|
            (0..7).each do |column|
                piece = @board[[row, column]]
                piece_color = ((piece.nil?) ? :white : piece.color)
                display_code = ((piece.nil?) ? '  ' : 'X ')

                case
                when piece_color == :white && (row + column).odd?
                    print display_code.white.on_magenta
                when piece_color == :white && (row + column).even?
                    print display_code.white.on_light_magenta
                when piece_color == :black && (row + column).odd?
                    print display_code.black.on_magenta
                when piece_color == :black && (row + column).even?
                    print display_code.black.on_light_magenta
                end
            end
            puts ''
        end
    end
end
