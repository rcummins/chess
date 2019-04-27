require 'RSpec'
require 'board'

describe 'Board' do
    let(:board) { Board.new }

    describe 'initialize' do
        it 'places pieces in the correct initial positions' do
            expect(board.rows[0][0].color).to eq(:black)
            expect(board.rows[1][0].color).to eq(:black)
            expect(board.rows[2][0]).to be_nil
            expect(board.rows[6][0].color).to eq(:white)
            expect(board.rows[7][7].color).to eq(:white)
            expect(board.rows[0][7].color).to eq(:black)
        end

        it 'sets the Piece @pos attribute correctly' do
            expect(board.rows[0][0].pos).to eq([0, 0])
            expect(board.rows[6][7].pos).to eq([6, 7])
        end
    end

    describe '[]' do
        it 'returns the correct value from the board' do
            pos = [0, 0]
            expect(board[pos]).to eq(board.rows[0][0])
        end
    end

    describe '[]=' do
        it 'updates the value at the correct position' do
            pos = [0, 0]
            new_value = Piece.new(:black, board, pos)
            board[pos] = new_value
            expect(board.rows[0][0]).to eq(new_value)
        end
    end

    describe '#move_piece' do
        it 'updates the board correctly' do
            board.move_piece([1, 0], [2, 0])
            expect(board.rows[1][0]).to be_nil
            expect(board.rows[2][0].color).to eq(:black)
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

    describe '#valid_pos?' do
        it 'returns true for a position that is on the board' do
            expect(board.valid_pos?([0, 0])).to eq(true)
        end

        it 'returns false for a position that is off the board' do
            expect(board.valid_pos?([-1, 0])).to eq(false)
            expect(board.valid_pos?([8, 0])).to eq(false)
        end
    end

    describe '#in_check?' do
        it 'returns false when the white king is not in check' do
            expect(board.in_check?(:white)).to eq(false)
            board.move_piece([6,5], [5,5])
            board.move_piece([1,4], [3,4])
            board.move_piece([6,6], [4,6])
            expect(board.in_check?(:white)).to eq(false)
        end

        it 'returns true when the white king is in check' do
            board.move_piece([6,5], [5,5])
            board.move_piece([1,4], [3,4])
            board.move_piece([6,6], [4,6])
            board.move_piece([0,3], [4,7])
            expect(board.in_check?(:white)).to eq(true)
        end
    end

    describe '#checkmate?' do
        it 'returns false when the white king is not in checkmate' do
            expect(board.checkmate?(:white)).to eq(false)
            board.move_piece([6,5], [5,5])
            board.move_piece([1,4], [3,4])
            board.move_piece([6,6], [4,6])
            expect(board.checkmate?(:white)).to eq(false)
        end

        it 'returns true when the white king is in checkmate' do
            board.move_piece([6,5], [5,5])
            board.move_piece([1,4], [3,4])
            board.move_piece([6,6], [4,6])
            board.move_piece([0,3], [4,7])
            expect(board.checkmate?(:white)).to eq(true)
        end
    end

    describe '#deep_dup' do
        it 'changes to the old board do not affect the duplicated board' do
            duped_board = board.deep_dup
            board[[0,0]] = nil
            board[[7,3]] = nil
            board[[1,1]].pos = [2,2]
            expect(board[[0,0]].class).to eq(NilClass)
            expect(board[[7,3]].class).to eq(NilClass)
            expect(board[[1,1]].pos).to eq([2,2])
            expect(duped_board[[0,0]].class).to eq(Rook)
            expect(duped_board[[7,3]].class).to eq(Queen)
            expect(duped_board[[1,1]].pos).to eq([1,1])
        end

        it 'changes to the duplicated board do not affect the old board' do
            duped_board = board.deep_dup
            duped_board[[0,0]] = nil
            duped_board[[7,3]] = nil
            duped_board[[1,1]].pos = [2,2]
            expect(board[[0,0]].class).to eq(Rook)
            expect(board[[7,3]].class).to eq(Queen)
            expect(board[[1,1]].pos).to eq([1,1])
            expect(duped_board[[0,0]].class).to eq(NilClass)
            expect(duped_board[[7,3]].class).to eq(NilClass)
            expect(duped_board[[1,1]].pos).to eq([2,2])
        end

        it 'duplicates instance variables' do
            duped_board = board.deep_dup
            expect(duped_board[[0,0]].color).to eq(:black)
            expect(duped_board[[0,0]].pos).to eq([0,0])
            expect(duped_board[[7,3]].color).to eq(:white)
            expect(duped_board[[7,3]].pos).to eq([7,3])
        end

        it 'duplicates nested arrays stored in instance variables' do
            duped_board = board.deep_dup
            expected_result = [[0, -1], [0, 1], [1, 0], [-1, 0]]
            expect(duped_board[[0,0]].horizontal_dirs).to eq(expected_result)
        end

        it 'updates the board referenced by pieces to be new duped board' do
            duped_board = board.deep_dup
            duped_board.move_piece([6,5], [5,5])
            referenced_board = duped_board[[0,0]].board
            expect(referenced_board[[6,5]]).to eq(nil)
            expect(referenced_board[[5,5]].class).to eq(Pawn)
        end
    end
end
