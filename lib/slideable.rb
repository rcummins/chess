module Slideable
    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    private 

    HORIZONTAL_DIRS = [:left, :right, :up, :down]
    DIAGONAL_DIRS = [:up_left, :up_right, :down_right, :down_left]
end