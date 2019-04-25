module Slideable
    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        end_positions = []

        move_dirs.each do |dir|
            new_pos = [@pos[0] + dir[0], @pos[1] + dir[1]]
            while @board[new_pos].nil? && @board.valid_pos?(new_pos)
                end_positions << new_pos
                new_pos = [new_pos[0] + dir[0], new_pos[1] + dir[1]]
            end
        end

        return end_positions
    end

    private 

    HORIZONTAL_DIRS = [[0, -1], [0, 1], [1, 0], [-1, 0]]
    DIAGONAL_DIRS = [[1, -1], [1, 1], [-1, 1], [-1, -1]]
end
