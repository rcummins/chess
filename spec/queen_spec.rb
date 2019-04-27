require 'RSpec'
require 'queen'
require 'board'

describe 'Queen' do
    let(:board) { Board.new }
    let(:queen) { Queen.new(:black, board, [3, 3]) }

    describe 'Slideable#moves' do
        it 'returns the correct array of possible end positions' do
            expected_horizontal = [[3,2], [3,1], [3,0], [3,4], [3,5], [3,6], 
                [3,7], [4,3], [5,3], [6,3], [2,3]]
            expected_diagonal = [[4,2], [5,1], [6,0], [4,4], [5,5], [6,6], 
                [2,4], [2,2]]
            expected_result = expected_horizontal + expected_diagonal
            expect(queen.moves).to eq(expected_result)
        end
    end

    describe 'Piece#valid_moves' do
        it 'returns the correct positions when king is in check' do
            board.move_piece([6,4], [4,4])
            board.move_piece([1,4], [2,4])
            board.move_piece([6,5], [5,5])
            board.move_piece([0,3], [3,6])
            board.move_piece([6,6], [5,6])
            board.move_piece([3,6], [5,4])
            expect(board[[7,3]].valid_moves).to eq([[6,4]])
        end
    end
end
