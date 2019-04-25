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
end
