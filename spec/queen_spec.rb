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
end
