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

    describe '#move_piece' do
        it 'updates the board correctly' do
            board.move_piece([1, 0], [2, 0])
            expect(board.rows[1][0]).to be_nil
            expect(board.rows[2][0].color).to eq(:white)
        end

        it "updates the piece's @pos correctly" do
            board.move_piece([1, 0], [2, 0])
            expect(board.rows[2][0].pos).to eq([2, 0])
        end

        it 'raises an error if there is no piece at start_pos' do
            err_msg = 'No piece at start_pos'
            expect{ board.move_piece([2, 0], [3, 0]) }.to raise_error(err_msg)
        end

        it 'raises an error if end_pos is off the board' do
            err_msg = 'Invalid position'
            expect{ board.move_piece([7, 7], [8, 7]) }.to raise_error(err_msg)
        end
    end
end
