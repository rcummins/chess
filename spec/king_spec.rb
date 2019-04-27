require 'RSpec'
require 'king'
require 'board'

describe 'King' do
    let(:board) { Board.new }
    
    describe 'Stepable#moves' do
        it 'returns correct positions when king is in middle of board' do
            king = King.new(:black, board, [3, 3])
            expected_results = [[3,4], [4,4], [4,3], [4,2], [3,2], [2,2], 
                [2,3], [2,4]]
            expect(king.moves).to eq(expected_results)
        end

        it 'returns correct positions when king is near his own pawns' do
            king = King.new(:black, board, [2, 3])
            expected_results = [[2,4], [3,4], [3,3], [3,2], [2,2]]
            expect(king.moves).to eq(expected_results)
        end

        it "returns correct positions when king is near opponent's pawns" do
            king = King.new(:black, board, [5, 3])
            expected_results = [[5,4], [6,4], [6,3], [6,2], [5,2], [4,2], 
                [4,3], [4,4]]
            expect(king.moves).to eq(expected_results)
        end

        it 'returns correct positions when king is near the edge of board' do
            king = King.new(:black, board, [3, 0])
            expected_results = [[3,1], [4,1], [4,0], [2,0], [2,1]]
            expect(king.moves).to eq(expected_results)
        end
    end

    describe 'Piece#valid_moves' do
        it 'returns correct positions when king is in check' do
            board.move_piece([6,5], [5,5])
            board.move_piece([1,4], [3,4])
            board.move_piece([6,6], [4,6])
            board.move_piece([1,0], [2,0])
            board.move_piece([6,4], [5,4])
            board.move_piece([0,3], [4,7])
            expect(board[[7,4]].moves).to eq([[6,4], [6,5]])
            expect(board[[7,4]].valid_moves).to eq([[6,4]])
        end
    end
end