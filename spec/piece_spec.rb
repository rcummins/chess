require 'RSpec'
require 'piece'
require 'board'

describe 'Piece' do
    let(:board) { Board.new }
    let(:piece) { Piece.new(:black, board, [7, 7]) }

    describe 'to_s' do
        it 'returns a string with the correct format' do
            expect(piece.to_s).to eq('X ')
        end
    end

    describe '#valid_moves' do
        it "returns all moves when there's no possibility of entering check" do
            expect(board[[7,4]].valid_moves).to eq(board[[7,4]].moves)
            board.move_piece([6,5], [5,5])
            board.move_piece([1,4], [3,4])
            board.move_piece([6,6], [4,6])
            expect(board[[7,4]].valid_moves).to eq(board[[7,4]].moves)
        end

        it "returns an empty array for the king when it is in checkmate" do
            expect(board[[7,4]].valid_moves).to eq(board[[7,4]].moves)
            board.move_piece([6,5], [5,5])
            board.move_piece([1,4], [3,4])
            board.move_piece([6,6], [4,6])
            board.move_piece([0,3], [4,7])
            expect(board[[7,4]].valid_moves).to eq([])
        end
    end

    describe '#pos=' do
        it 'updates @pos to the new position' do
            piece.pos = [7, 6]
            expect(piece.pos).to eq([7, 6])
        end

        it 'raises an error if the argument is not a two-element array' do
            expect{ piece.pos = 1 }.to raise_error('Invalid position')
            expect{ piece.pos = [1,2,3] }.to raise_error('Invalid position')
        end

        it 'raises an error if the new pos is off the edge of the board' do
            expect{ piece.pos = [7, -1] }.to raise_error('Invalid position')
            expect{ piece.pos = [8, 6] }.to raise_error('Invalid position')
        end
    end
end
