require 'RSpec'
require 'bishop'
require 'board'

describe 'Bishop' do
    let(:board) { Board.new }
    let(:bishop) { Bishop.new(:black, board, [3, 3]) }

    describe 'Slideable#moves' do
        it 'returns the correct array of possible end positions' do
            expected_result = [[4,2], [5,1], [6,0], [4,4], [5,5], [6,6], 
                [2,4], [2,2]]
            expect(bishop.moves).to eq(expected_result)
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
            expected_moves = [[6, 6], [5, 7], [6, 4], [5, 3], [4, 2], [3, 1], 
                [2, 0]]
            expect(board[[7,5]].moves).to eq(expected_moves)
            expect(board[[7,5]].valid_moves).to eq([[6,4]])
        end
    end
end
