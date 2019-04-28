require_relative 'piece'

class Pawn < Piece
    def symbol
        "\u265F "
    end

    def moves
        end_positions = []

        # add one step forward to the list of positions if it is on the board 
        # and it is empty
        one_step = add_diff_to_pos(@pos, step_forward)
        if @board.valid_pos?(one_step) && @board[one_step].nil?
            end_positions << one_step
        end

        # add two steps forward to the list of positions if:
        # 1. the pawn is on the starting row and
        # 2. the position two steps forward is on the board and
        # 3. the first step is empty and 
        # 4. the second step is empty
        two_steps = add_diff_to_pos(one_step, step_forward)
        if at_start_row? &&
            @board.valid_pos?(two_steps) &&
            @board[one_step].nil? &&
            @board[two_steps].nil?
                end_positions << two_steps
        end

        # consider side attacks
        side_attacks.each do |diff|
            new_pos = add_diff_to_pos(@pos, diff)

            # add this position to the list of moves if it is on the board 
            # and is occupied by a piece of the opposite color
            if (@board.valid_pos?(new_pos) && !@board[new_pos].nil? &&
                @board[new_pos].color != @color)
                    end_positions << new_pos
            end
        end
        
        return end_positions
    end
    
    private

    def add_diff_to_pos(start_pos, diff)
        [start_pos[0] + diff[0], start_pos[1] + diff[1]]
    end
    
    def at_start_row?
        @color == :black && @pos[0] == 1 || @color == :white && @pos[0] == 6
    end
    
    def forward_dir
        @color == :black ? 1 : -1
    end
    
    def step_forward
        [forward_dir, 0]
    end
    
    def side_attacks
        [[forward_dir, 1], [forward_dir, -1]]
    end
end
