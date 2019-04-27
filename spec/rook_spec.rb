require 'RSpec'
require 'rook'
require 'board'

describe 'Rook' do
    let(:board) { Board.new }
    let(:rook) { Rook.new(:black, board, [3, 3]) }

    describe 'Slideable#moves' do
        it 'returns the correct array of possible end positions' do
            expected_result = [[3,2], [3,1], [3,0], [3,4], [3,5], [3,6], 
                [3,7], [4,3], [5,3], [6,3], [2,3]]
            expect(rook.moves).to eq(expected_result)
        end
    end

    describe 'Piece#valid_moves' do
        it 'returns the correct positions when king is in check' do
            board.move_piece([6,4], [4,4])
            board.move_piece([1,4], [2,4])
            board.move_piece([6,5], [5,5])
            board.move_piece([0,3], [3,6])
            board.move_piece([6,6], [5,6])
            board.move_piece([1,0], [2,0])
            board.move_piece([6,7], [5,7])
            board.move_piece([1,1], [2,1])
            board.move_piece([7,7], [6,7])
            board.move_piece([3,6], [5,4])
            expect(board[[6,7]].moves).to eq([[6,6], [6,5], [6,4], [7,7]])
            expect(board[[6,7]].valid_moves).to eq([[6,4]])
        end
    end
end
