require 'RSpec'
require 'pawn'
require 'board'

describe 'Pawn' do
    let(:board) { Board.new }

    describe '#moves' do
        context 'when the pawn is on the starting row' do
            it 'correct when black, no pieces in front' do
                pawn = Pawn.new(:black, board, [1, 3])
                expect(pawn.moves).to eq([[2,3], [3,3]])
            end

            it 'correct when white, no pieces in front' do
                pawn = Pawn.new(:white, board, [6, 3])
                expect(pawn.moves).to eq([[5,3], [4,3]])
            end

            it 'correct when 1 opposing piece in front' do
                pawn = Pawn.new(:black, board, [1, 3])
                board.rows[2][3] = Pawn.new(:white, board, [2, 3])
                expect(pawn.moves).to eq([[2,3]])
            end

            it 'correct when 2 opposing pieces in front/diagonal' do
                pawn = Pawn.new(:black, board, [1, 3])
                board.rows[2][3] = Pawn.new(:white, board, [2, 3])
                board.rows[2][4] = Pawn.new(:white, board, [2, 4])
                expect(pawn.moves).to eq([[2,3], [2,4]])
            end

            it 'correct when 3 opposing pieces in front/diagonal' do
                pawn = Pawn.new(:black, board, [1, 3])
                board.rows[2][3] = Pawn.new(:white, board, [2, 3])
                board.rows[2][4] = Pawn.new(:white, board, [2, 4])
                board.rows[2][2] = Pawn.new(:white, board, [2, 2])
                expect(pawn.moves).to eq([[2,3], [2,4], [2,2]])
            end

            it 'correct when 2 opposing pieces in diagonals (not front)' do
                pawn = Pawn.new(:black, board, [1, 3])
                board.rows[2][4] = Pawn.new(:white, board, [2, 4])
                board.rows[2][2] = Pawn.new(:white, board, [2, 2])
                expect(pawn.moves).to eq([[2,3], [3,3], [2,4], [2,2]])
            end

            it 'correct when 1 same-side piece in front' do
                pawn = Pawn.new(:black, board, [1, 3])
                board.rows[2][3] = Pawn.new(:black, board, [2, 3])
                expect(pawn.moves).to eq([])
            end
            
            it 'correct when 3 same-side pieces in front/diagonal' do
                pawn = Pawn.new(:black, board, [1, 3])
                board.rows[2][3] = Pawn.new(:black, board, [2, 3])
                board.rows[2][4] = Pawn.new(:black, board, [2, 4])
                board.rows[2][2] = Pawn.new(:black, board, [2, 2])
                expect(pawn.moves).to eq([])
            end

            it 'correct when 2 same-side pieces in diagonals (not front)' do
                pawn = Pawn.new(:black, board, [1, 3])
                board.rows[2][4] = Pawn.new(:black, board, [2, 4])
                board.rows[2][2] = Pawn.new(:black, board, [2, 2])
                expect(pawn.moves).to eq([[2,3], [3,3]])
            end

            it 'correct when opposing piece is 2 steps away' do
                pawn = Pawn.new(:black, board, [1, 3])
                board.rows[3][3] = Pawn.new(:white, board, [3, 3])
                expect(pawn.moves).to eq([[2,3], [3,3]])
            end

            it 'correct when same-side piece is 2 steps away' do
                pawn = Pawn.new(:black, board, [1, 3])
                board.rows[3][3] = Pawn.new(:black, board, [3, 3])
                expect(pawn.moves).to eq([[2,3]])
            end
        end

        context 'when the pawn is not on the starting row' do
            it 'correct when no pieces in front' do
                pawn = Pawn.new(:black, board, [2,3])
                expect(pawn.moves).to eq([[3,3]])
            end

            it 'correct when black, 3 opposing pieces in front/diagonal' do
                pawn = Pawn.new(:black, board, [5,3])
                expect(pawn.moves).to eq([[6,3], [6,4], [6,2]])
            end

            it 'correct when white, 3 opposing pieces in front/diagonal' do
                pawn = Pawn.new(:white, board, [2,3])
                expect(pawn.moves).to eq([[1,3], [1,4], [1,2]])
            end

            it 'correct when on board edge, 2 opponents in front/diagonal' do
                pawn = Pawn.new(:black, board, [5,0])
                expect(pawn.moves).to eq([[6,0], [6,1]])
            end
        end
    end
end