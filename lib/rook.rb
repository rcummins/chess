require_relative 'piece'
require_relative 'slideable'

class Rook < Piece
    include Slideable

    def symbol
        "\u265C "
    end

    protected

    def move_dirs
        horizontal_dirs
    end
end
