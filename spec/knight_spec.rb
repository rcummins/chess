require 'RSpec'
require 'knight'
require 'board'

describe 'Knight' do
    let(:board) { Board.new }

    describe 'Stepable#moves' do
        it 'returns correct positions when knight is near own side' do
            knight = Knight.new(:black, board, [2, 2])
            expected_results = [[3,0], [3,4], [4,1], [4,3]]
            expect(knight.moves).to eq(expected_results)
        end

        it "returns correct positions when knight is near opponent's side" do
            knight = Knight.new(:black, board, [5, 5])
            expected_results = [[3,4], [3,6], [4,3], [4,7], [6,3], [6,7], 
                [7,4], [7,6]]
            expect(knight.moves).to eq(expected_results)
        end

        it 'returns correct positions when knight is near edge of board' do
            knight = Knight.new(:black, board, [5, 0])
            expected_results = [[3,1], [4,2], [6,2], [7,1]]
            expect(knight.moves).to eq(expected_results)
        end
    end
end
