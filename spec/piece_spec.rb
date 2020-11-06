require '../lib/chess'
require 'pry'
require 'movement'

describe 'Piece' do
  before { @chess = Chess.new }

  describe 'Rook' do
    describe '#generate_possible_movement' do
      context 'White' do
        context 'D4' do
          it 'return array: [[[-1, 0], [-2, 0], [-3, 0]], [[1, 0]],[[0, -1], [0, -2], [0, -3]], [[0, 1], [0, 2], [0, 3], [0, 4]]]' do
            @chess.board[4][3].piece = Rook.new('white', [4, 3])
            @chess.board[4][3].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[4][3].piece.possible_movement).to eql([[-1, 0], [-2, 0], [-3, 0], [1, 0], [0, -1], [0, -2], [0, -3], [0, 1], [0, 2], [0, 3], [0, 4]])
          end
        end
        context 'A3' do
          it 'return array: [[-1, 0], [-2, 0], [-3, 0], [-4, 0]], [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7]]]' do
            @chess.board[5][0].piece = Rook.new('white', [5, 0])
            @chess.board[5][0].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[5][0].piece.possible_movement).to eql([[-1, 0], [-2, 0], [-3, 0], [-4, 0], [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7]])
          end
        end
        context 'A8' do
          it 'return array: [[[1, 0]], [[0, 1]]]' do
            @chess.board[0][0].piece = Rook.new('white', [0, 0])
            @chess.board[0][0].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[0][0].piece.possible_movement).to eql([[1, 0], [0, 1]])
          end
        end
        context 'E8' do
          it 'return array: [[[1, 0]], [[0, -1]], [[0, 1]]]' do
            @chess.board[0][4].piece = Rook.new('white', [0, 4])
            @chess.board[0][4].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[0][4].piece.possible_movement).to eql([[1, 0], [0, -1], [0, 1]])
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
            expect(@chess.board[6][7].piece.possible_movement).to eql([[-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0]])
          end
        end
      end
      context 'Black' do
        context 'D4' do
          it 'return array: [[[-1, 0], [-2, 0], [-3, 0]], [[1, 0]],[[0, -1], [0, -2], [0, -3]], [[0, 1], [0, 2], [0, 3], [0, 4]]]' do
            @chess.board[4][3].piece = Rook.new('black', [4, 3])
            @chess.board[4][3].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[4][3].piece.possible_movement).to eql([[-1, 0], [-2, 0], [1, 0], [2, 0], [0, -1], [0, -2], [0, -3], [0, 1], [0, 2], [0, 3], [0, 4]])
          end
        end
        context 'A3' do
          it 'return array: [[[-1, 0], [-2, 0], [-3, 0]], [[1, 0]], [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7]]]' do
            @chess.board[5][0].piece = Rook.new('black', [5, 0])
            @chess.board[5][0].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[5][0].piece.possible_movement).to eql([[-1, 0], [-2, 0], [-3, 0], [1, 0], [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7]])
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
            expect(@chess.board[7][0].piece.possible_movement).to eql([[-1, 0], [0, 1]])
          end
        end
        context 'C1' do
          it 'return array: [[[-1, 0]],[[0, -1]],[[0, 1]]]' do
            @chess.board[7][2].piece = Rook.new('black', [7, 2])
            @chess.board[7][2].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[7][2].piece.possible_movement).to eql([[-1, 0], [0, -1], [0, 1]])
          end
        end
        context 'H2' do
          it 'return array: [[[-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0]]]' do
            @chess.board[6][7].piece = Rook.new('black', [6, 7])
            @chess.board[6][7].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[6][7].piece.possible_movement).to eql([[-1, 0], [-2, 0], [-3, 0], [-4, 0], [1, 0], [0, -1]])
          end
        end
      end
    end
  end

  describe 'Knight' do
    describe '#generate_possible_movement' do
      context 'White' do
        context 'D4' do
          it 'return array: [[1,2],[-1,2],[-2,1],[-2,-1],[-1,-2],[1,-2]]' do
            @chess.board[4][3].piece = Knight.new('white', [4, 3])
            @chess.board[4][3].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[4][3].piece.possible_movement).to eql([[1,2],[-1,2],[-2,1],[-2,-1],[-1,-2],[1,-2]])
          end
        end
        context 'A3' do
          it 'return array: [[-1,2],[-2,1]]' do
            @chess.board[5][0].piece = Knight.new('white', [5, 0])
            @chess.board[5][0].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[5][0].piece.possible_movement).to eql([[-1,2],[-2,1]])
          end
        end
        context 'A8' do
          it 'return array: [[1,2],[2,1]]' do
            @chess.board[0][0].piece = Knight.new('white', [0, 0])
            @chess.board[0][0].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[0][0].piece.possible_movement).to eql([[1,2],[2,1]])
          end
        end
        context 'E8' do
          it 'return array: [[1,2],[2,1],[1,-2],[2,-1]]' do
            @chess.board[0][4].piece = Knight.new('white', [0, 4])
            @chess.board[0][4].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[0][4].piece.possible_movement).to eql([[1,2],[2,1],[1,-2],[2,-1]])
          end
        end
        context 'A1' do
          it 'return array: [[-2,1]]' do
            @chess.board[7][0].piece = Knight.new('white', [7, 0])
            @chess.board[7][0].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[7][0].piece.possible_movement).to eql([[-2,1]])
          end
        end
        context 'C1' do
          it 'return array: [[-2,1],[-2,-1]]' do
            @chess.board[7][2].piece = Knight.new('white', [7, 2])
            @chess.board[7][2].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[7][2].piece.possible_movement).to eql([[-2,1],[-2,-1]])
          end
        end
        context 'H2' do
          it 'return array: [[-2,-1],[-1,-2]]' do
            @chess.board[6][7].piece = Knight.new('white', [6, 7])
            @chess.board[6][7].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[6][7].piece.possible_movement).to eql([[-2,-1],[-1,-2]])
          end
        end
      end
      context 'Black' do
        context 'D4' do
          it 'return array: [[1,2],[2,1],[-1,2],[-2,1],[-2,-1],[-1,-2],[1,-2],[2,-1]]' do
            @chess.board[4][3].piece = Knight.new('black', [4, 3])
            @chess.board[4][3].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[4][3].piece.possible_movement).to eql([[1,2],[2,1],[-1,2],[-2,1],[-2,-1],[-1,-2],[1,-2],[2,-1]])
          end
        end
        context 'A3' do
          it 'return array: [[1,2],[2,1],[-1,2],[-2,1]]' do
            @chess.board[5][0].piece = Knight.new('black', [5, 0])
            @chess.board[5][0].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[5][0].piece.possible_movement).to eql([[1,2],[2,1],[-1,2],[-2,1]])
          end
        end
        context 'A8' do
          it 'return array: [[2,1]]' do
            @chess.board[0][0].piece = Knight.new('black', [0, 0])
            @chess.board[0][0].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[0][0].piece.possible_movement).to eql([[2,1]])
          end
        end
        context 'E8' do
          it 'return array: [[2,1],[2,-1]]' do
            @chess.board[0][4].piece = Knight.new('black', [0, 4])
            @chess.board[0][4].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[0][4].piece.possible_movement).to eql([[2,1],[2,-1]])
          end
        end
        context 'A1' do
          it 'return array: [[-1,2],[-2,1]]' do
            @chess.board[7][0].piece = Knight.new('black', [7, 0])
            @chess.board[7][0].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[7][0].piece.possible_movement).to eql([[-1,2],[-2,1]])
          end
        end
        context 'C1' do
          it 'return array: [[-1,2],[-2,1],[-2,-1],[-1,-2]]' do
            @chess.board[7][2].piece = Knight.new('black', [7, 2])
            @chess.board[7][2].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[7][2].piece.possible_movement).to eql([[-1,2],[-2,1],[-2,-1],[-1,-2]])
          end
        end
        context 'H2' do
          it 'return array: [[-2,-1],[-1,-2],[1,-2]]' do
            @chess.board[6][7].piece = Knight.new('black', [6, 7])
            @chess.board[6][7].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[6][7].piece.possible_movement).to eql([[-2,-1],[-1,-2],[1,-2]])
          end
        end
      end
    end
  end

  describe 'Bishop' do
    describe '#generate_possible_movement' do
      context 'White' do
        context 'D4' do
          it 'return array: [[[1, 1]],[[-1, -1], [-2, -2], [-3, -3]],[[-1, 1], [-2, 2], [-3, 3]],[[1, -1]]]' do
            @chess.board[4][3].piece = Bishop.new('white', [4, 3])
            @chess.board[4][3].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[4][3].piece.possible_movement).to eql([[1, 1],[-1, -1], [-2, -2], [-3, -3],[-1, 1], [-2, 2], [-3, 3],[1, -1]])
          end
        end
        context 'A3' do
          it 'return array: [[[-1, 1], [-2, 2], [-3, 3], [-4, 4]]]' do
            @chess.board[5][0].piece = Bishop.new('white', [5, 0])
            @chess.board[5][0].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[5][0].piece.possible_movement).to eql([[-1, 1], [-2, 2], [-3, 3], [-4, 4]])
          end
        end
        context 'A8' do
          it 'return array: [[[1, 1]]]' do
            @chess.board[0][0].piece = Bishop.new('white', [0, 0])
            @chess.board[0][0].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[0][0].piece.possible_movement).to eql([[1, 1]])
          end
        end
        context 'E8' do
          it 'return array: [[[1, 1]],[[1, -1]]]' do
            @chess.board[0][4].piece = Bishop.new('white', [0, 4])
            @chess.board[0][4].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[0][4].piece.possible_movement).to eql([[1, 1],[1, -1]])
          end
        end
        context 'A1' do
          it 'return array: []' do
            @chess.board[7][0].piece = Bishop.new('white', [7, 0])
            @chess.board[7][0].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[7][0].piece.possible_movement).to eql([])
          end
        end
        context 'C1' do
          it 'return array: []' do
            @chess.board[7][2].piece = Bishop.new('white', [7, 2])
            @chess.board[7][2].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[7][2].piece.possible_movement).to eql([])
          end
        end
        context 'H2' do
          it 'return array: [[[-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5]]]' do
            @chess.board[6][7].piece = Bishop.new('white', [6, 7])
            @chess.board[6][7].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[6][7].piece.possible_movement).to eql([[-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5]])
          end
        end
      end
      context 'Black' do
        context 'D4' do
          it 'return array: [[[1, 1], [2, 2]],[[-1, -1], [-2, -2]],[[-1, 1], [-2, 2]],[[1, -1], [2, -2]]]' do
            @chess.board[4][3].piece = Bishop.new('black', [4, 3])
            @chess.board[4][3].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[4][3].piece.possible_movement).to eql([[1, 1], [2, 2],[-1, -1], [-2, -2],[-1, 1], [-2, 2],[1, -1], [2, -2]])
          end
        end
        context 'A3' do
          it 'return array: [[[1, 1]],[[-1, 1], [-2, 2], [-3, 3]]]' do
            @chess.board[5][0].piece = Bishop.new('black', [5, 0])
            @chess.board[5][0].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[5][0].piece.possible_movement).to eql([[1, 1],[-1, 1], [-2, 2], [-3, 3]])
          end
        end
        context 'A8' do
          it 'return array: []' do
            @chess.board[0][0].piece = Bishop.new('black', [0, 0])
            @chess.board[0][0].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[0][0].piece.possible_movement).to eql([])
          end
        end
        context 'E8' do
          it 'return array: []' do
            @chess.board[0][4].piece = Bishop.new('black', [0, 4])
            @chess.board[0][4].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[0][4].piece.possible_movement).to eql([])
          end
        end
        context 'A1' do
          it 'return array: [[[-1, 1]]]' do
            @chess.board[7][0].piece = Bishop.new('black', [7, 0])
            @chess.board[7][0].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[7][0].piece.possible_movement).to eql([[-1, 1]])
          end
        end
        context 'C1' do
          it 'return array: [[[-1, -1]],[[-1, 1]]]' do
            @chess.board[7][2].piece = Bishop.new('black', [7, 2])
            @chess.board[7][2].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[7][2].piece.possible_movement).to eql([[-1, -1],[-1, 1]])
          end
        end
        context 'H2' do
          it 'return array: [[[-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0]]]' do
            @chess.board[6][7].piece = Bishop.new('black', [6, 7])
            @chess.board[6][7].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[6][7].piece.possible_movement).to eql([[-1, -1], [-2, -2], [-3, -3], [-4, -4],[1, -1]])
          end
        end
      end
    end
  end

  describe 'Pawn' do
    describe '#generate_possible_movement' do
      context 'White' do
        context 'D4' do
          it 'return array: [[-1,0]]' do
            @chess.board[4][3].piece = Pawn.new('white', [6, 3])
            @chess.board[4][3].piece.position = [4,3]
            @chess.board[4][3].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[4][3].piece.possible_movement).to eql([[-1,0]])
          end
        end
        context 'A3' do
          it 'return array: [[-1,0]]' do
            @chess.board[5][0].piece = Pawn.new('white', [6, 0])
            @chess.board[5][0].piece.position = [5,0]
            @chess.board[5][0].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[5][0].piece.possible_movement).to eql([[-1,0]])
          end
        end
        context 'A8 (No upgrade)' do
          it 'return array: []' do
            @chess.board[0][0].piece = Pawn.new('white', [0, 0])
            @chess.board[0][0].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[0][0].piece.possible_movement).to eql([])
          end
        end
        context 'E8 (No upgrade)' do
          it 'return array: [[[1, 1]],[[1, -1]]]' do
            @chess.board[0][4].piece = Pawn.new('white', [0, 4])
            @chess.board[0][4].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[0][4].piece.possible_movement).to eql([])
          end
        end
        context 'H2' do
          it 'return array: [[-1,0],[-2,0]]' do
            @chess.board[6][7].piece = Pawn.new('white', [6, 7])
            @chess.board[6][7].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[6][7].piece.possible_movement).to eql([[-1,0],[-2,0]])
          end
        end
        context 'H6' do
          it 'return: [[-1,-1]]' do
            @chess.board[2][7].piece = Pawn.new('white',[6,7])
            @chess.board[2][7].piece.position = [2,7]
            @chess.board[2][7].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[2][7].piece.possible_movement).to eql([[-1,-1]])
          end
        end
        context 'D6' do
          it 'return: [[-1,-1],[-1,1]]' do
            @chess.board[2][3].piece = Pawn.new('white', [6,3])
            @chess.board[2][3].piece.position = [2,3]
            @chess.board[2][3].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[2][3].piece.possible_movement).to eql([[-1,-1],[-1,1]])
          end
        end
      end
      context 'Black' do
        context 'D4' do
          it 'return array: [[1,0]]' do
            @chess.board[4][3].piece = Pawn.new('black', [1, 3])
            @chess.board[4][3].piece.position = [4,3]
            @chess.board[4][3].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[4][3].piece.possible_movement).to eql([[1,0]])
          end
        end
        context 'A3' do
          it 'return array: [[1,1]]' do
            @chess.board[5][0].piece = Pawn.new('black', [1, 0])
            @chess.board[5][0].piece.position = [5,0]
            @chess.board[5][0].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[5][0].piece.possible_movement).to eql([[1,1]])
          end
        end
        context 'A1 (No upgrade)' do
          it 'return array: []' do
            @chess.board[7][0].piece = Pawn.new('black', [7, 0])
            @chess.board[7][0].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[7][0].piece.possible_movement).to eql([])
          end
        end
        context 'C3' do
          it 'return array: [[1,-1],[1,1]]' do
            @chess.board[5][2].piece = Pawn.new('black', [1, 2])
            @chess.board[5][2].piece.position = [5,2]
            @chess.board[5][2].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[5][2].piece.possible_movement).to eql([[1,-1],[1,1]])
          end
        end
        context 'H2' do
          it 'return array: [[1,0],[2,0],[1,-1],[1,1]]' do
            @chess.board[6][7].piece = Pawn.new('black', [6, 7])
            @chess.board[6][7].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[6][7].piece.possible_movement).to eql([[1,-1]])
          end
        end
        context 'F7' do
          it 'return array: [[1,0],[2,0],[1,-1],[1,1]]' do
            @chess.board[1][5].piece = Pawn.new('black', [1, 5])
            @chess.board[1][5].piece.generate_possible_movement(@chess.board)
            expect(@chess.board[1][5].piece.possible_movement).to eql([[1,0],[2,0]])
          end
        end
      end
    end
  end
  
  describe 'King' do
    before {@empty_board = Chess.new(false)}
    describe '#check?' do
      it 'return false' do
        @empty_board.board[3][3].piece = King.new('white',[7,4])
        @empty_board.board[3][3].piece.position = [3,3]
        @empty_board.board[3][3].piece.generate_possible_movement(@empty_board.board)
        @empty_board.board[0][0].piece = Rook.new('black', [0,0])
        @empty_board.board[0][0].piece.generate_possible_movement(@empty_board.board)
        expect(@empty_board.board[3][3].piece.check?(@empty_board.get_pieces_by_color('black'))).to eql(false)
      end

      it 'return true' do
        @empty_board.board[3][3].piece = King.new('white',[7,4])
        @empty_board.board[3][3].piece.position = [3,3]
        @empty_board.board[3][3].piece.generate_possible_movement(@empty_board.board)
        @empty_board.board[0][0].piece = Bishop.new('black', [0,2])
        @empty_board.board[0][0].piece.position = [0,0]
        @empty_board.board[0][0].piece.generate_possible_movement(@empty_board.board)
        expect(@empty_board.board[3][3].piece.check?(@empty_board.get_pieces_by_color('black'))).to eql(true)
      end

      it 'return true' do
        @empty_board.board[3][3].piece = King.new('white',[7,4])
        @empty_board.board[3][3].piece.position = [3,3]
        @empty_board.board[3][3].piece.generate_possible_movement(@empty_board.board)
        @empty_board.board[3][0].piece = Rook.new('black', [0,0])
        @empty_board.board[3][0].piece.position = [3,0]
        @empty_board.board[3][0].piece.generate_possible_movement(@empty_board.board)
        expect(@empty_board.board[3][3].piece.check?(@empty_board.get_pieces_by_color('black'))).to eql(true)
      end

      it 'return true' do
        @empty_board.board[3][3].piece = King.new('black',[1,4])
        @empty_board.board[3][3].piece.position = [3,3]
        @empty_board.board[3][3].piece.generate_possible_movement(@empty_board.board)
        @empty_board.board[4][2].piece = Pawn.new('white', [6,2])
        @empty_board.board[4][2].piece.position = [4,2]
        @empty_board.board[4][2].piece.generate_possible_movement(@empty_board.board)
        expect(@empty_board.board[3][3].piece.check?(@empty_board.get_pieces_by_color('white'))).to eql(true)
      end
      it 'return false' do
        @empty_board.board[3][3].piece = King.new('black',[6,4])
        @empty_board.board[3][3].piece.position = [3,3]
        @empty_board.board[3][3].piece.generate_possible_movement(@empty_board.board)
        @empty_board.board[4][3].piece = Pawn.new('white', [6,3])
        @empty_board.board[4][3].piece.position = [4,3]
        @empty_board.board[4][3].piece.generate_possible_movement(@empty_board.board)
        expect(@empty_board.board[3][3].piece.check?(@empty_board.get_pieces_by_color('white'))).to eql(false)
      end
    end
    describe '#stalemate?' do
      it 'return true' do
        @empty_board.board[0][7].piece  = King.new('black', [0,4])
        @empty_board.board[0][7].piece.position = [0, 7]
        @empty_board.board[0][7].piece.generate_possible_movement(@empty_board.board)

        @empty_board.board[2][6].piece = Rook.new('white', [7,7])
        @empty_board.board[2][6].piece.position  = [2,6]
        @empty_board.board[2][6].piece.generate_possible_movement(@empty_board.board)

        @empty_board.board[2][7].piece = King.new('white', [7,4])
        @empty_board.board[2][7].piece.position  = [2,7]
        @empty_board.board[2][7].piece.generate_possible_movement(@empty_board.board)

        expect(@empty_board.board[0][7].piece.stalemate?(@empty_board.get_pieces_by_color('white'))).to eql(true)
      end

      it 'return false' do
        @empty_board.board[0][7].piece  = King.new('black', [0,4])
        @empty_board.board[0][7].piece.position = [0, 7]
        @empty_board.board[0][7].piece.generate_possible_movement(@empty_board.board)

        @empty_board.board[2][7].piece = King.new('white', [7,4])
        @empty_board.board[2][7].piece.position  = [2,7]
        @empty_board.board[2][7].piece.generate_possible_movement(@empty_board.board)

        expect(@empty_board.board[0][7].piece.stalemate?(@empty_board.get_pieces_by_color('white'))).to eql(false)
      end
      it 'return false' do
        @empty_board.board[0][7].piece  = King.new('black', [0,4])
        @empty_board.board[0][7].piece.position = [0, 7]
        @empty_board.board[0][7].piece.generate_possible_movement(@empty_board.board)

        @empty_board.board[2][6].piece = Rook.new('white', [7,7])
        @empty_board.board[2][6].piece.position  = [2,6]
        @empty_board.board[2][6].piece.generate_possible_movement(@empty_board.board)

        @empty_board.board[2][7].piece = Rook.new('white', [7,4])
        @empty_board.board[2][7].piece.position  = [2,7]
        @empty_board.board[2][7].piece.generate_possible_movement(@empty_board.board)

        expect(@empty_board.board[0][7].piece.stalemate?(@empty_board.get_pieces_by_color('white'))).to eql(false)
      end

      it 'return false' do
        @empty_board.board[3][3].piece = King.new('white',[7,4])
        @empty_board.board[3][3].piece.position = [3,3]
        @empty_board.board[3][3].piece.generate_possible_movement(@empty_board.board)
        @empty_board.board[0][0].piece = Bishop.new('black', [0,2])
        @empty_board.board[0][0].piece.position = [0,0]
        @empty_board.board[0][0].piece.generate_possible_movement(@empty_board.board)
        expect(@empty_board.board[3][3].piece.stalemate?(@empty_board.get_pieces_by_color('black'))).to eql(false)
      end
        
    end
    describe '#checkmate?' do
      it 'return true' do
        @empty_board.board[0][7].piece  = King.new('black', [0,4])
        @empty_board.board[0][7].piece.position = [0, 7]
        @empty_board.board[0][7].piece.generate_possible_movement(@empty_board.board)

        @empty_board.board[2][7].piece = King.new('white', [7,4])
        @empty_board.board[2][7].piece.position  = [2,7]
        @empty_board.board[2][7].piece.generate_possible_movement(@empty_board.board)

        @empty_board.board[0][4].piece = Rook.new('white', [7,7])
        @empty_board.board[0][4].piece.position  = [0,4]
        @empty_board.board[0][4].piece.generate_possible_movement(@empty_board.board)

        expect(@empty_board.board[0][7].piece.checkmate?(@empty_board.get_pieces_by_color('white'))).to eql(true)
      end

      it 'return false' do
        @empty_board.board[0][7].piece  = King.new('black', [0,4])
        @empty_board.board[0][7].piece.position = [0, 7]
        @empty_board.board[0][7].piece.generate_possible_movement(@empty_board.board)

        @empty_board.board[0][4].piece = Rook.new('white', [7,7])
        @empty_board.board[0][4].piece.position  = [0,4]
        @empty_board.board[0][4].piece.generate_possible_movement(@empty_board.board)

        expect(@empty_board.board[0][7].piece.checkmate?(@empty_board.get_pieces_by_color('white'))).to eql(false)

      end

      it 'return false' do
        @empty_board.board[0][7].piece  = King.new('black', [0,4])
        @empty_board.board[0][7].piece.position = [0, 7]
        @empty_board.board[0][7].piece.generate_possible_movement(@empty_board.board)

        @empty_board.board[2][6].piece = Rook.new('white', [7,7])
        @empty_board.board[2][6].piece.position  = [2,6]
        @empty_board.board[2][6].piece.generate_possible_movement(@empty_board.board)

        @empty_board.board[2][7].piece = King.new('white', [7,4])
        @empty_board.board[2][7].piece.position  = [2,7]
        @empty_board.board[2][7].piece.generate_possible_movement(@empty_board.board)

        expect(@empty_board.board[0][7].piece.checkmate?(@empty_board.get_pieces_by_color('white'))).to eql(false)
      end
    end
  end

end
