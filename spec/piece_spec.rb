require 'RSpec'
require 'piece'
require 'board'

describe 'Piece' do
    let(:board) { Board.new }
    let(:piece) { Piece.new(:black, board, [7, 7]) }

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
