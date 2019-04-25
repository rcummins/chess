module Stepable
    def moves
        end_positions = []

        move_diffs.each do |diff_row, diff_column|
            new_pos = [@pos[0] + diff_row, @pos[1] + diff_column]

            # add this position to the list of moves if it:
            # 1. is on the board
            # 2. and is empty or occupied by a piece of the opposite color
            if @board.valid_pos?(new_pos) && 
                (@board[new_pos].nil? || @board[new_pos].color != @color)
                end_positions << new_pos
            end
        end
        
        return end_positions
    end
end