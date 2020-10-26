require '../lib/chess'

describe 'Chess' do

  before {@chess = Chess.new}

  describe '#move' do
    context 'A8 Rook' do
      it 'return nil' do
        expect(@chess.move_piece('A8', 'A6')).to eql(@chess.board[0][0])
      end
      it 'return nil' do
        expect(@chess.move_piece('A8', 'B8')).to eql(@chess.board[0][0])
      end
      it 'return nil' do
        expect(@chess.move_piece('A8', 'G8')).to eql(@chess.board[0][0])
      end
    end
  end
end