require 'RSpec'
require 'rook'
require 'board'

describe 'Rook' do
    let(:board) { Board.new }
    let(:rook) { Rook.new(:black, board, [3, 3]) }

    describe 'Slideable#moves' do
        it 'returns the correct array of possible end positions' do
            expected_res = [[3,2], [3,1], [3,0], [3,4], [3,5], [3,6], [3,7], 
                [4,3], [5,3], [6,3], [2,3]]
            expect(rook.moves).to eq(expected_res)
        end
    end
end
