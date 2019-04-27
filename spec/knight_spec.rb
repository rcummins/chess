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

    describe 'Piece#valid_moves' do
        it 'returns the correct positions when king is in check' do
            board.move_piece([6,4], [4,4])
            board.move_piece([1,4], [2,4])
            board.move_piece([6,5], [5,5])
            board.move_piece([0,3], [3,6])
            board.move_piece([6,6], [5,6])
            board.move_piece([3,6], [5,4])
            expect(board[[7,6]].moves).to eq([[5,7], [6,4]])
            expect(board[[7,6]].valid_moves).to eq([[6,4]])
        end
    end
end
