require 'RSpec'
require 'board'

describe 'Board' do
    let(:board) { Board.new }

    describe 'initialize' do
        it 'places pieces in the correct initial positions' do
            expect(board.rows[0][0].color).to eq(:white)
            expect(board.rows[1][0].color).to eq(:white)
            expect(board.rows[2][0]).to be_nil
            expect(board.rows[6][0].color).to eq(:black)
            expect(board.rows[7][7].color).to eq(:black)
            expect(board.rows[0][7].color).to eq(:white)
        end

        it 'sets the Piece @pos attribute correctly' do
            expect(board.rows[0][0].pos).to eq([0, 0])
            expect(board.rows[6][7].pos).to eq([6, 7])
        end
    end
end