require '../lib/chess'
require 'pry'

describe 'Piece' do
  before { @chess = Chess.new }

  describe 'Rook' do
    describe '#generate_possible_movement' do
      context 'White' do
        context 'D4' do
          it 'return array: [[[-1, 0], [-2, 0], [-3, 0]], [[1, 0]],[[0, -1], [0, -2], [0, -3]], [[0, 1], [0, 2], [0, 3], [0, 4]]]' do
            @chess.board[4][3].piece = Rook.new('white', [4, 3])
            @chess.board[4][3].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[4][3].piece.possible_movement).to eql([[[-1, 0], [-2, 0], [-3, 0]], [[1, 0]], [[0, -1], [0, -2], [0, -3]], [[0, 1], [0, 2], [0, 3], [0, 4]]])
          end
        end
        context 'A3' do
          it 'return array: [[-1, 0], [-2, 0], [-3, 0], [-4, 0]], [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7]]]' do
            @chess.board[5][0].piece = Rook.new('white', [5, 0])
            @chess.board[5][0].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[5][0].piece.possible_movement).to eql([[[-1, 0], [-2, 0], [-3, 0], [-4, 0]], [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7]]])
          end
        end
        context 'A8' do
          it 'return array: [[[1, 0]], [[0, 1]]]' do
            @chess.board[0][0].piece = Rook.new('white', [0, 0])
            @chess.board[0][0].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[0][0].piece.possible_movement).to eql([[[1, 0]], [[0, 1]]])
          end
        end
        context 'E8' do
          it 'return array: [[[1, 0]], [[0, -1]], [[0, 1]]]' do
            @chess.board[0][4].piece = Rook.new('white', [0, 4])
            @chess.board[0][4].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[0][4].piece.possible_movement).to eql([[[1, 0]], [[0, -1]], [[0, 1]]])
          end
        end
        context 'A1' do
          it 'return array: []' do
            @chess.board[7][0].piece = Rook.new('white', [7, 0])
            @chess.board[7][0].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[7][0].piece.possible_movement).to eql([])
          end
        end
        context 'C1' do
          it 'return array: []' do
            @chess.board[7][2].piece = Rook.new('white', [7, 2])
            @chess.board[7][2].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[7][2].piece.possible_movement).to eql([])
          end
        end
        context 'H2' do
          it 'return array: [[[-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0]]]' do
            @chess.board[6][7].piece = Rook.new('white', [6, 7])
            @chess.board[6][7].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[6][7].piece.possible_movement).to eql([[[-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0]]])
          end
        end
      end
      context 'Black' do
        context 'D4' do
          it 'return array: [[[-1, 0], [-2, 0], [-3, 0]], [[1, 0]],[[0, -1], [0, -2], [0, -3]], [[0, 1], [0, 2], [0, 3], [0, 4]]]' do
            @chess.board[4][3].piece = Rook.new('black', [4, 3])
            @chess.board[4][3].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[4][3].piece.possible_movement).to eql([[[-1, 0], [-2, 0]],[[1, 0], [2, 0]],[[0, -1], [0, -2], [0, -3]],[[0, 1], [0, 2], [0, 3], [0, 4]]])
          end
        end
        context 'A3' do
          it 'return array: [[[-1, 0], [-2, 0], [-3, 0]], [[1, 0]], [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7]]]' do
            @chess.board[5][0].piece = Rook.new('black', [5, 0])
            @chess.board[5][0].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[5][0].piece.possible_movement).to eql([[[-1, 0], [-2, 0], [-3, 0]], [[1, 0]], [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7]]])
          end
        end
        context 'A8' do
          it 'return array: []' do
            @chess.board[0][0].piece = Rook.new('black', [0, 0])
            @chess.board[0][0].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[0][0].piece.possible_movement).to eql([])
          end
        end
        context 'E8' do
          it 'return array: []' do
            @chess.board[0][4].piece = Rook.new('black', [0, 4])
            @chess.board[0][4].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[0][4].piece.possible_movement).to eql([])
          end
        end
        context 'A1' do
          it 'return array: [[[-1, 0]],[[0, 1]]]' do
            @chess.board[7][0].piece = Rook.new('black', [7, 0])
            @chess.board[7][0].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[7][0].piece.possible_movement).to eql([[[-1, 0]],[[0, 1]]])
          end
        end
        context 'C1' do
          it 'return array: [[[-1, 0]],[[0, -1]],[[0, 1]]]' do
            @chess.board[7][2].piece = Rook.new('black', [7, 2])
            @chess.board[7][2].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[7][2].piece.possible_movement).to eql([[[-1, 0]],[[0, -1]],[[0, 1]]])
          end
        end
        context 'H2' do
          it 'return array: [[[-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0]]]' do
            @chess.board[6][7].piece = Rook.new('black', [6, 7])
            @chess.board[6][7].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[6][7].piece.possible_movement).to eql([[[-1, 0], [-2, 0], [-3, 0], [-4, 0]],[[1, 0]],[[0, -1]]])
          end
        end
      end
    end
  end
end
