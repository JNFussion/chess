require '../lib/chess'
require 'pry'

describe 'Chess' do
  before { @chess = Chess.new }
  before { @empty_chess = Chess.new(false) }
  describe '#move' do
    context 'd4 Rook initial board' do
      it 'White rook: d4 to d7 return Rook' do
        @chess.board[4][3].piece = Rook.new('white', [4, 3])
        @chess.board[4][3].piece.generate_possible_movement(@chess.board)
        pawn = @chess.board[1][3].piece
        expect(@chess.move_piece('d4', 'd7')).to eql(pawn)
      end

      it 'White rook: d4 to b4 return Rook' do
        @chess.board[4][3].piece = Rook.new('white', [4, 3])
        @chess.board[4][3].piece.generate_possible_movement(@chess.board)

        expect(@chess.move_piece('d4', 'b4')).to eql(@chess.board[4][1].piece)
      end

      it 'White rook: d4 to h4 return Rook' do
        @chess.board[4][3].piece = Rook.new('white', [4, 3])
        @chess.board[4][3].piece.generate_possible_movement(@chess.board)
        expect(@chess.move_piece('d4', 'h4')).to eql(@chess.board[4][7].piece)
      end

      it 'Black rook: d4 to d2 return nil' do
        @chess.board[4][3].piece = Rook.new('black', [4, 3])
        @chess.board[4][3].piece.generate_possible_movement(@chess.board)
        pawn = @chess.board[6][3].piece
        expect(@chess.move_piece('d4', 'd2')).to eql(pawn)
      end

      it 'Black rook: d4 to b4 return Rook' do
        @chess.board[4][3].piece = Rook.new('black', [4, 3])
        @chess.board[4][3].piece.generate_possible_movement(@chess.board)

        expect(@chess.move_piece('d4', 'b4')).to eql(@chess.board[4][1].piece)
      end

      it 'Black rook: d4 to H4 return Rook' do
        @chess.board[4][3].piece = Rook.new('black', [4, 3])
        @chess.board[4][3].piece.generate_possible_movement(@chess.board)

        expect(@chess.move_piece('d4', 'h4')).to eql(@chess.board[4][7].piece)
      end
    end
  end

  describe '#correct_input?' do
    it 'Input: "" return false' do
      expect(@chess.correct_input?('')).to eql(false)
    end
    it 'Input: "123" return false' do
      expect(@chess.correct_input?('123')).to eql(false)
    end
    it 'Input: "asd" return false' do
      expect(@chess.correct_input?('asd')).to eql(false)
    end
    it 'Input: ",.@" return false' do
      expect(@chess.correct_input?(',.@')).to eql(false)
    end
    it 'Input: "Be5" return true' do
      expect(@chess.correct_input?('Be5')).to eql(true)
    end
    it 'Input: "asdBe5" return true' do
      expect(@chess.correct_input?('asdBe5')).to eql(false)
    end
    it 'Input: "Nf3" return true' do
      expect(@chess.correct_input?('Nf3')).to eql(true)
    end
    it 'Input: "c5" return true' do
      expect(@chess.correct_input?('c5')).to eql(true)
    end
    it 'Input: "c5123sad" return true' do
      expect(@chess.correct_input?('c5123sad')).to eql(false)
    end
    it 'Input: "Bxe5" return true' do
      expect(@chess.correct_input?('Bxe5')).to eql(true)
    end
    it 'Input "exd5" return true' do
      expect(@chess.correct_input?('exd5')).to eql(true)
    end
    it 'Input "exd6e.p." return true' do
      expect(@chess.correct_input?('exd6e.p.')).to eql(true)
    end
    it 'Input "O-O" return true' do
      expect(@chess.correct_input?('O-O')).to eql(true)
    end
    it 'Input "O-O-O" return true' do
      expect(@chess.correct_input?('O-O-O')).to eql(true)
    end
    it 'Input "e8=Q" return true' do
      expect(@chess.correct_input?('e8=Q')).to eql(true)
    end
    it 'Input "e8Q" return true' do
      expect(@chess.correct_input?('e8Q')).to eql(true)
    end
    it 'Input "e8=R" return true' do
      expect(@chess.correct_input?('e8=R')).to eql(true)
    end
    it 'Input "Rxd8+" return true' do
      expect(@chess.correct_input?('Rxd8+')).to eql(true)
    end
    it 'Input "Rxd8#" return true' do
      expect(@chess.correct_input?('Rxd8#')).to eql(true)
    end
    it 'Input "R1a3" return true' do
      expect(@chess.correct_input?('R1a3')).to eql(true)
    end
    it 'Input "R1a3" return true' do
      expect(@chess.correct_input?('R1a3')).to eql(true)
    end
    it 'Input "Qh4e1" return true' do
      expect(@chess.correct_input?('Qh4e1')).to eql(true)
    end
  end

  describe '#find_by_name' do
    it 'Get white king' do
      expect(@chess.find_by_name('K', 'white')).to eql([@chess.board[7][4]])
    end

    it 'Get black King' do
      expect(@chess.find_by_name('K', 'black')).to eql([@chess.board[0][4]])
    end

    it 'There is no white king' do
      @empty_chess = Chess.new(false)
      expect(@empty_chess.find_by_name('K', 'white')).to eql([])
    end

    it 'There is no white king' do
      @empty_chess = Chess.new(false)
      expect(@empty_chess.find_by_name('K', 'black')).to eql([])
    end
  end

  describe '#correct_option?' do
    it 'option "" return false' do
      expect(@chess.correct_option?('')).to eql(false)
    end
    it 'option: "asd" return false' do
      expect(@chess.correct_option?('asd')).to eql(false)
    end
    it 'option "123" return false' do
      expect(@chess.correct_option?('123')).to eql(false)
    end
    it 'option "asd123" return false' do
      expect(@chess.correct_option?('asd123')).to eql(false)
    end
    it 'option "," return false' do
      expect(@chess.correct_option?(',')).to eql(false)
    end

    context 'option 1' do
      it 'option "1" return true' do
        expect(@chess.correct_option?('1')).to eql(true)
      end
      it 'option "1." return true' do
        expect(@chess.correct_option?('1.')).to eql(true)
      end
      it 'option "play" return true' do
        expect(@chess.correct_option?('play')).to eql(true)
      end
      it 'option "PLAY" return true' do
        expect(@chess.correct_option?('PLAY')).to eql(true)
      end
      it 'option "play game" return true' do
        expect(@chess.correct_option?('play game')).to eql(true)
      end
      it 'option "1. PLAY GAME" return true' do
        expect(@chess.correct_option?('1. PLAY GAME')).to eql(true)
      end
    end

    context 'option 2' do
      it 'option "2" return true' do
        expect(@chess.correct_option?('2')).to eql(true)
      end
      it 'option "2." return true' do
        expect(@chess.correct_option?('2.')).to eql(true)
      end
      it 'option "save" return true' do
        expect(@chess.correct_option?('save')).to eql(true)
      end
      it 'option "save" return true' do
        expect(@chess.correct_option?('SAVE')).to eql(true)
      end
      it 'option "save game" return true' do
        expect(@chess.correct_option?('SAVE game')).to eql(true)
      end
      it 'option "1. SAVE GAME" return true' do
        expect(@chess.correct_option?('2. SAVE GAME')).to eql(true)
      end
    end
    context 'option 3' do
      it 'option "3" return true' do
        expect(@chess.correct_option?('3')).to eql(true)
      end
      it 'option "3." return true' do
        expect(@chess.correct_option?('3.')).to eql(true)
      end
      it 'option "load" return true' do
        expect(@chess.correct_option?('load')).to eql(true)
      end
      it 'option "LOAD" return true' do
        expect(@chess.correct_option?('LOAD')).to eql(true)
      end
      it 'option "load game" return true' do
        expect(@chess.correct_option?('LOAD game')).to eql(true)
      end
      it 'option "1. LOAD GAME" return true' do
        expect(@chess.correct_option?('3. LOAD GAME')).to eql(true)
      end
    end
  end

  describe '#get_by_notation' do
    it 'a8: return rook' do
      expect(@chess.get_by_notation('a8', 'black')).to eql(@chess.board[0][0])
    end
    it 'e8: return king' do
      expect(@chess.get_by_notation('e8', 'black')).to eql(@chess.board[0][4])
    end
    it 'c2: return pawn' do
      expect(@chess.get_by_notation('c2', 'white')).to eql(@chess.board[6][2])
    end
    it 'd4: return nil' do
      expect(@chess.get_by_notation('d4', 'white')).to eql(@chess.board[4][3])
    end
  end

  describe '#move' do
    context 'Predict check King.' do
      context '#will_leave_king_in_check?' do
        it 'Black king in check. Move king to save square' do
          @empty_chess.board[2][3].piece = King.new('black', [0,4])
          @empty_chess.board[2][5].piece = Bishop.new('black', [0,5])
          @empty_chess.board[3][7].piece = Knight.new('black', [0,6])
          @empty_chess.board[5][6].piece = Bishop.new('white', [7,5])
          
          @empty_chess.board[2][3].piece.position = [2, 3]
          @empty_chess.board[2][5].piece.position = [2, 5]
          @empty_chess.board[3][7].piece.position = [3, 7]
          @empty_chess.board[5][6].piece.position = [5, 6]

          @empty_chess.update_possible_movement_all_pieces

          expect(@empty_chess.will_leave_king_in_check?([2, 3], [2, 2])).to eql(false)
        end

        it 'Black king in check. Move bishop to parry' do
          @empty_chess.board[2][3].piece = King.new('black', [0,4])
          @empty_chess.board[2][5].piece = Bishop.new('black', [0,5])
          @empty_chess.board[3][7].piece = Knight.new('black', [0,6])
          @empty_chess.board[5][6].piece = Bishop.new('white', [7,5])
          
          @empty_chess.board[2][3].piece.position = [2, 3]
          @empty_chess.board[2][5].piece.position = [2, 5]
          @empty_chess.board[3][7].piece.position = [3, 7]
          @empty_chess.board[5][6].piece.position = [5, 6]

          @empty_chess.update_possible_movement_all_pieces
          
          expect(@empty_chess.will_leave_king_in_check?([2, 5], [3, 4])).to eql(false)
        end

        it 'Black king in check. Knight take bishop to block check' do
          @empty_chess.board[2][3].piece = King.new('black', [0,4])
          @empty_chess.board[2][5].piece = Bishop.new('black', [0,5])
          @empty_chess.board[3][7].piece = Knight.new('black', [0,6])
          @empty_chess.board[5][6].piece = Bishop.new('white', [7,5])
          
          @empty_chess.board[2][3].piece.position = [2, 3]
          @empty_chess.board[2][5].piece.position = [2, 5]
          @empty_chess.board[3][7].piece.position = [3, 7]
          @empty_chess.board[5][6].piece.position = [5, 6]

          @empty_chess.update_possible_movement_all_pieces

          expect(@empty_chess.will_leave_king_in_check?([3, 7], [5, 6])).to eql(false)
        end

        it 'Bishop move, leaving king in check. ' do
          @empty_chess.board[2][3].piece = King.new('black', [0,4])
          @empty_chess.board[3][4].piece = Bishop.new('black', [0,5])
          @empty_chess.board[3][7].piece = Knight.new('black', [0,6])
          @empty_chess.board[5][6].piece = Bishop.new('white', [7,5])
          
          @empty_chess.board[2][3].piece.position = [2, 3]
          @empty_chess.board[3][4].piece.position = [3, 4]
          @empty_chess.board[3][7].piece.position = [3, 7]
          @empty_chess.board[5][6].piece.position = [5, 6]

          @empty_chess.update_possible_movement_all_pieces

          expect(@empty_chess.will_leave_king_in_check?([3, 4], [2, 5])).to eql(true)
        end
      end
      context '#move' do
        it 'Black king in check. King in d6 move to c6' do
          @empty_chess.board[2][3].piece = King.new('black', [0,4])
          @empty_chess.board[2][5].piece = Bishop.new('black', [0,5])
          @empty_chess.board[3][7].piece = Knight.new('black', [0,6])
          @empty_chess.board[5][6].piece = Bishop.new('white', [7,5])
          
          @empty_chess.board[2][3].piece.position = [2, 3]
          @empty_chess.board[2][5].piece.position = [2, 5]
          @empty_chess.board[3][7].piece.position = [3, 7]
          @empty_chess.board[5][6].piece.position = [5, 6]
          
          king = @empty_chess.board[2][3].piece
          
          @empty_chess.update_possible_movement_all_pieces

          expect(@empty_chess.move('Kc6', 'black')).to eql(king)
        end

        it 'Black king in check. Bishop in f6 move to e5. It parries check' do
          @empty_chess.board[2][3].piece = King.new('black', [0,4])
          @empty_chess.board[2][5].piece = Bishop.new('black', [0,5])
          @empty_chess.board[3][7].piece = Knight.new('black', [0,6])
          @empty_chess.board[5][6].piece = Bishop.new('white', [7,5])
          
          @empty_chess.board[2][3].piece.position = [2, 3]
          @empty_chess.board[2][5].piece.position = [2, 5]
          @empty_chess.board[3][7].piece.position = [3, 7]
          @empty_chess.board[5][6].piece.position = [5, 6]
          bishop = @empty_chess.board[2][5].piece
          
          @empty_chess.update_possible_movement_all_pieces
          
          expect(@empty_chess.move('Be5', 'black')).to eql(bishop)
        end

        it 'Black king in check. Knight take white bishop to block check' do
          @empty_chess.board[2][3].piece = King.new('black', [0,4])
          @empty_chess.board[2][5].piece = Bishop.new('black', [0,5])
          @empty_chess.board[3][7].piece = Knight.new('black', [0,6])
          @empty_chess.board[5][6].piece = Bishop.new('white', [7,5])
          
          @empty_chess.board[2][3].piece.position = [2, 3]
          @empty_chess.board[2][5].piece.position = [2, 5]
          @empty_chess.board[3][7].piece.position = [3, 7]
          @empty_chess.board[5][6].piece.position = [5, 6]
          
          bishop = @empty_chess.board[5][6].piece

          @empty_chess.update_possible_movement_all_pieces

          expect(@empty_chess.move('Nxg3', 'black')).to eql(bishop)
        end

        it 'Illigal move. Bishop in e5 move to f6' do
          @empty_chess.board[2][3].piece = King.new('black', [0,4])
          @empty_chess.board[3][4].piece = Bishop.new('black', [0,5])
          @empty_chess.board[3][7].piece = Knight.new('black', [0,6])
          @empty_chess.board[5][6].piece = Bishop.new('white', [7,5])
          
          @empty_chess.board[2][3].piece.position = [2, 3]
          @empty_chess.board[3][4].piece.position = [3, 4]
          @empty_chess.board[3][7].piece.position = [3, 7]
          @empty_chess.board[5][6].piece.position = [5, 6]

          @empty_chess.update_possible_movement_all_pieces

          expect(@empty_chess.move('Bf6', 'black')).to eql(nil)
        end
      end

    end
    context 'piece movement' do
      context 'Non pawn movement' do
        it 'Be5' do
          @empty_chess.board[0][4].piece = King.new('black', [0,4])
          @empty_chess.board[1][6].piece = Bishop.new('black', [0, 5])
          @empty_chess.board[1][6].piece.position = [1, 6]
          @empty_chess.update_possible_movement_all_pieces
          expect(@empty_chess.move('Be5', 'black')).to eql(@empty_chess.board[3][4].piece)
        end

        it 'Bdb8' do
          # Black Rook d8
          @empty_chess.board[0][3].piece = Rook.new('black', [0, 0])
          @empty_chess.board[0][3].piece.position = [0, 3]
          
          # Black Rook h8
          @empty_chess.board[0][7].piece = Rook.new('black', [0, 7])
          
          # White Rook a1
          @empty_chess.board[7][0].piece = Rook.new('white', [7, 0])
          
          # White Rook a5
          @empty_chess.board[3][0].piece = Rook.new('white', [7, 7])
          @empty_chess.board[3][0].piece.position = [3, 0]
          
          # White Queen e4
          @empty_chess.board[4][4].piece = Queen.new('white', [4, 4])
          
          # White Queen h4
          @empty_chess.board[4][7].piece = Queen.new('white', [4, 7])
          
          # White Queen h1
          @empty_chess.board[7][7].piece = Queen.new('white', [7, 7])
          
          expect(@empty_chess.move('Bdb8', 'black')).to eql(nil)
        end

        it 'Rf8: return nil if notation is ambiguos' do
          # Black Rook d8
          @empty_chess.board[0][3].piece = Rook.new('black', [0, 0])
          @empty_chess.board[0][3].piece.position = [0, 3]
          
          # Black Rook h8
          @empty_chess.board[0][7].piece = Rook.new('black', [0, 7])
          
          # White Rook a1
          @empty_chess.board[7][0].piece = Rook.new('white', [7, 0])
          
          # White Rook a5
          @empty_chess.board[3][0].piece = Rook.new('white', [7, 7])
          @empty_chess.board[3][0].piece.position = [3, 0]
          
          # White Queen e4
          @empty_chess.board[4][4].piece = Queen.new('white', [4, 4])
          
          # White Queen h4
          @empty_chess.board[4][7].piece = Queen.new('white', [4, 7])
          
          # White Queen h1
          @empty_chess.board[7][7].piece = Queen.new('white', [7, 7])
          @empty_chess.update_possible_movement_all_pieces

          expect(@empty_chess.move('Rf8', 'black')).to eql(nil)
        end
        it 'Rdf8' do
          # Black king
          @empty_chess.board[0][2].piece = King.new('black', [0,4])
          @empty_chess.board[0][2].piece.position = [0,2]
          # White king
          @empty_chess.board[0][0].piece = King.new('white', [7,4])
          @empty_chess.board[0][0].piece.position = [0, 0]
          # Black Rook d8
          @empty_chess.board[0][3].piece = Rook.new('black', [0, 0])
          @empty_chess.board[0][3].piece.position = [0, 3]
          rook = @empty_chess.board[0][3].piece
          # Black Rook h8
          @empty_chess.board[0][7].piece = Rook.new('black', [0, 7])
          # White Rook a1
          @empty_chess.board[7][0].piece = Rook.new('white', [7, 0])

          # White Rook a5
          @empty_chess.board[3][0].piece = Rook.new('white', [7, 7])
          @empty_chess.board[3][0].piece.position = [3, 0]

          # White Queen e4
          @empty_chess.board[4][4].piece = Queen.new('white', [4, 4])

          # White Queen h4
          @empty_chess.board[4][7].piece = Queen.new('white', [4, 7])

          # White Queen h1
          @empty_chess.board[7][7].piece = Queen.new('white', [7, 7])

          @empty_chess.update_possible_movement_all_pieces

          expect(@empty_chess.move('Rdf8', 'black')).to eql(rook)
        end

        it 'R1a3' do
          # Black king
          @empty_chess.board[0][2].piece = King.new('black', [0,4])
          @empty_chess.board[0][2].piece.position = [0,2]
          # White king
          @empty_chess.board[0][0].piece = King.new('white', [7,4])
          @empty_chess.board[0][0].piece.position = [0, 0]
          # Black Rook d8
          @empty_chess.board[0][3].piece = Rook.new('black', [0, 0])
          @empty_chess.board[0][3].piece.position = [0, 3]
          # Black Rook h8
          @empty_chess.board[0][7].piece = Rook.new('black', [0, 7])

          # White Rook a1
          @empty_chess.board[7][0].piece = Rook.new('white', [7, 0])
          rook = @empty_chess.board[7][0].piece
          # White Rook a5
          @empty_chess.board[3][0].piece = Rook.new('white', [7, 7])
          @empty_chess.board[3][0].piece.position = [3, 0]
          # White Queen e4
          @empty_chess.board[4][4].piece = Queen.new('white', [4, 4])

          # White Queen h4
          @empty_chess.board[4][7].piece = Queen.new('white', [4, 7])
          # White Queen h1
          @empty_chess.board[7][7].piece = Queen.new('white', [7, 7])
          @empty_chess.update_possible_movement_all_pieces
          expect(@empty_chess.move('R1a3', 'white')).to eql(rook)
        end

        it 'Ra3 return nil if notation is ambiguos' do
          # Black Rook d8
          @empty_chess.board[0][3].piece = Rook.new('black', [0, 0])
          @empty_chess.board[0][3].piece.position = [0, 3]
          
          # Black Rook h8
          @empty_chess.board[0][7].piece = Rook.new('black', [0, 7])
          
          # White Rook a1
          @empty_chess.board[7][0].piece = Rook.new('white', [7, 0])
          
          # White Rook a5
          @empty_chess.board[3][0].piece = Rook.new('white', [7, 7])
          @empty_chess.board[3][0].piece.position = [3, 0]
          
          # White Queen e4
          @empty_chess.board[4][4].piece = Queen.new('white', [4, 4])
          
          # White Queen h4
          @empty_chess.board[4][7].piece = Queen.new('white', [4, 7])
          
          # White Queen h1
          @empty_chess.board[7][7].piece = Queen.new('white', [7, 7])
          @empty_chess.update_possible_movement_all_pieces

          expect(@empty_chess.move('Ra3', 'white')).to eql(nil)
        end

        it 'Qh4e1' do
          # Black king
          @empty_chess.board[0][2].piece = King.new('black', [0,4])
          @empty_chess.board[0][2].piece.position = [0,2]
          # White king
          @empty_chess.board[0][0].piece = King.new('white', [7,4])
          @empty_chess.board[0][0].piece.position = [0, 0]
          # Black Rook d8
          @empty_chess.board[0][3].piece = Rook.new('black', [0, 0])
          @empty_chess.board[0][3].piece.position = [0, 3]
          
          # Black Rook h8
          @empty_chess.board[0][7].piece = Rook.new('black', [0, 7])
          
          # White Rook a1
          @empty_chess.board[7][0].piece = Rook.new('white', [7, 0])
          
          # White Rook a5
          @empty_chess.board[3][0].piece = Rook.new('white', [7, 7])
          @empty_chess.board[3][0].piece.position = [3, 0]
          
          # White Queen e4
          @empty_chess.board[4][4].piece = Queen.new('white', [4, 4])
          
          # White Queen h4
          @empty_chess.board[4][7].piece = Queen.new('white', [4, 7])
          
          queen = @empty_chess.board[4][7].piece
          # White Queen h1
          @empty_chess.board[7][7].piece = Queen.new('white', [7, 7])
          @empty_chess.update_possible_movement_all_pieces

          expect(@empty_chess.move('Qh4e1', 'white')).to eql(queen)
        end

        it 'Qh4e1: return nil if the name of the piece dont match' do
          # Black Rook d8
          @empty_chess.board[0][3].piece = Rook.new('black', [0, 0])
          @empty_chess.board[0][3].piece.position = [0, 3]
          
          # Black Rook h8
          @empty_chess.board[0][7].piece = Rook.new('black', [0, 7])
          
          # White Rook a1
          @empty_chess.board[7][0].piece = Rook.new('white', [7, 0])
          
          # White Rook a5
          @empty_chess.board[3][0].piece = Rook.new('white', [7, 7])
          @empty_chess.board[3][0].piece.position = [3, 0]
          
          # White Queen e4
          @empty_chess.board[4][4].piece = Queen.new('white', [4, 4])
          
          # White Queen h4
          @empty_chess.board[4][7].piece = Knight.new('white', [4, 7])
          
          # White Queen h1
          @empty_chess.board[7][7].piece = Queen.new('white', [7, 7])
          

          expect(@empty_chess.move('Qh4e1', 'white')).to eql(nil)
        end
      end
      context 'pawn' do
        it 'c5' do
          expect(@chess.move('c5', 'black')).to eql(@chess.board[3][2].piece)
        end
      end
    end
    context 'piece take' do
      context 'Non pawn take' do
        it 'Bxe5' do
          # Black king
          @empty_chess.board[0][2].piece = King.new('black', [0,4])
          @empty_chess.board[0][2].piece.position = [0,2]
          # White king
          @empty_chess.board[0][0].piece = King.new('white', [7,4])
          @empty_chess.board[0][0].piece.position = [0, 0]
          
          @empty_chess.board[1][6].piece = Bishop.new('black', [0, 5])
          @empty_chess.board[1][6].piece.position = [1, 6]
          
          pawn = Pawn.new('white', [6, 4])
          pawn.position = [3, 4]
          @empty_chess.board[3][4].piece = pawn
          @empty_chess.update_possible_movement_all_pieces

          expect(@empty_chess.move('Bxe5', 'black')).to eql(pawn)
        end

        it 'Rdxf8' do
          # Black king
          @empty_chess.board[0][2].piece = King.new('black', [0,4])
          @empty_chess.board[0][2].piece.position = [0,2]
          # White king
          @empty_chess.board[0][0].piece = King.new('white', [7,4])
          @empty_chess.board[0][0].piece.position = [0, 0]
          # Black Rook d8
          @empty_chess.board[0][3].piece = Rook.new('black', [0, 0])
          @empty_chess.board[0][3].piece.position = [0, 3]
          # White Knight f8
          @empty_chess.board[0][5].piece = Knight.new('white', [7, 6])
          @empty_chess.board[0][5].piece.position = [0, 5]
          knight = @empty_chess.board[0][5].piece
          # Black Rook h8
          @empty_chess.board[0][7].piece = Rook.new('black', [0, 7])
          # White Rook a1
          @empty_chess.board[7][0].piece = Rook.new('white', [7, 0])
          # White Rook a5
          @empty_chess.board[3][0].piece = Rook.new('white', [7, 7])
          @empty_chess.board[3][0].piece.position = [3, 0]
          # White Queen e4
          @empty_chess.board[4][4].piece = Queen.new('white', [4, 4])
          # White Queen h4
          @empty_chess.board[4][7].piece = Queen.new('white', [4, 7])
          # White Queen h1
          @empty_chess.board[7][7].piece = Queen.new('white', [7, 7])
          @empty_chess.update_possible_movement_all_pieces

          expect(@empty_chess.move('Rdxf8', 'black')).to eql(knight)
        end

        it 'R1xa3' do
          
          # Black king
          @empty_chess.board[0][2].piece = King.new('black', [0,4])
          @empty_chess.board[0][2].piece.position = [0,2]
          # White king
          @empty_chess.board[0][0].piece = King.new('white', [7,4])
          @empty_chess.board[0][0].piece.position = [0, 0]
          # Black Rook d8
          @empty_chess.board[0][3].piece = Rook.new('black', [0, 0])
          @empty_chess.board[0][3].piece.position = [0, 3]
          # Black Rook h8
          @empty_chess.board[0][7].piece = Rook.new('black', [0, 7])
          # White Rook a1
          @empty_chess.board[7][0].piece = Rook.new('white', [7, 0])
          # Black Bishop a3
          @empty_chess.board[5][0].piece = Bishop.new('black', [0, 5])
          @empty_chess.board[5][0].piece.position = [5, 0]
          bishop = @empty_chess.board[5][0].piece
          # White Rook a5
          @empty_chess.board[3][0].piece = Rook.new('white', [7, 7])
          @empty_chess.board[3][0].piece.position = [3, 0]
          # White Queen e4
          @empty_chess.board[4][4].piece = Queen.new('white', [4, 4])
          # White Queen h4
          @empty_chess.board[4][7].piece = Queen.new('white', [4, 7])
          # White Queen h1
          @empty_chess.board[7][7].piece = Queen.new('white', [7, 7])
          @empty_chess.update_possible_movement_all_pieces

          expect(@empty_chess.move('R1xa3', 'white')).to eql(bishop)
        end

        it 'Qh4xe1' do
          
          # Black king
          @empty_chess.board[0][2].piece = King.new('black', [0,4])
          @empty_chess.board[0][2].piece.position = [0,2]
          # White king
          @empty_chess.board[0][0].piece = King.new('white', [7,4])
          @empty_chess.board[0][0].piece.position = [0, 0]
          # Black Rook d8
          @empty_chess.board[0][3].piece = Rook.new('black', [0, 0])
          @empty_chess.board[0][3].piece.position = [0, 3]
          
          # Black Rook h8
          @empty_chess.board[0][7].piece = Rook.new('black', [0, 7])
          
          # White Rook a1
          @empty_chess.board[7][0].piece = Rook.new('white', [7, 0])
          
          # White Rook a5
          @empty_chess.board[3][0].piece = Rook.new('white', [7, 7])
          @empty_chess.board[3][0].piece.position = [3, 0]
          
          # White Queen e4
          @empty_chess.board[4][4].piece = Queen.new('white', [4, 4])
          
          # White Queen h4
          @empty_chess.board[4][7].piece = Queen.new('white', [4, 7])
          
          # White Queen h1
          @empty_chess.board[7][7].piece = Queen.new('white', [7, 7])
          # Black Knight e1
          @empty_chess.board[7][4].piece = Knight.new('black', [7, 4])
          @empty_chess.update_possible_movement_all_pieces
          knight = @empty_chess.board[7][4].piece
          expect(@empty_chess.move('Qh4xe1', 'white')).to eql(knight)
        end
      end
      context 'Pawn take' do
        it 'exd5' do
          pawn = @chess.move_piece('d7', 'd5')
          @chess.move_piece('e2', 'e4')
          expect(@chess.move('exd5', 'white')).to eql(pawn)
        end
      end
    end
    context 'en passant' do
      it 'exd6e.p.' do
        @chess.move('e4', 'white')
        @chess.move('e6', 'black')
        @chess.move('e5', 'white')
        pawn = @chess.move('d5', 'black')
        expect(@chess.move('exd6e.p.', 'white')).to eql(pawn)
      end

      it 'exd6e.p.' do
        @chess.move('e4', 'white')
        @chess.move('e5', 'black')
        @chess.move('Nf3', 'white')
        @chess.move('Nf6', 'black')
        @chess.move('d4', 'white')
        @chess.move('exd4', 'black')
        @chess.move('e5', 'white')
        @chess.move('Ne4', 'black')
        @chess.move('Qxd4', 'white')
        pawn = @chess.move('d5', 'black')

        expect(@chess.move('exd6e.p.', 'white')).to eql(pawn)
      end
    end

    context 'upgrade' do
      it 'e8Q' do
        # Black king
        @empty_chess.board[0][2].piece = King.new('black', [0,4])
        @empty_chess.board[0][2].piece.position = [0,2]
        # White king
        @empty_chess.board[0][0].piece = King.new('white', [7,4])
        @empty_chess.board[0][0].piece.position = [0, 0]

        @empty_chess.board[1][4].piece = Pawn.new('white', [6, 4])
        @empty_chess.board[1][4].piece.position = [1, 4]
        @empty_chess.update_possible_movement_all_pieces
        expect(@empty_chess.move('e8Q', 'white').class).to eql(Queen)
      end

      it 'dxe8Q' do
        # Black king
        @empty_chess.board[0][2].piece = King.new('black', [0,4])
        @empty_chess.board[0][2].piece.position = [0,2]
        # White king
        @empty_chess.board[0][0].piece = King.new('white', [7,4])
        @empty_chess.board[0][0].piece.position = [0, 0]
        
        @empty_chess.board[1][3].piece = Pawn.new('white', [6, 3])
        @empty_chess.board[1][3].piece.position = [1, 3]
        @empty_chess.board[0][4].piece = Rook.new('black', [0, 7])
        @empty_chess.board[0][4].piece.position = [0, 4]
        
        @empty_chess.update_possible_movement_all_pieces
        
        expect(@empty_chess.move('dxe8Q', 'white').class).to eql(Queen)
      end

      it 'e8=Q' do
        # Black king
        @empty_chess.board[0][2].piece = King.new('black', [0,4])
        @empty_chess.board[0][2].piece.position = [0,2]
        # White king
        @empty_chess.board[0][0].piece = King.new('white', [7,4])
        @empty_chess.board[0][0].piece.position = [0, 0]
        
        @empty_chess.board[1][4].piece = Pawn.new('white', [6, 4])
        @empty_chess.board[1][4].piece.position = [1, 4]
        @empty_chess.update_possible_movement_all_pieces

        expect(@empty_chess.move('e8=Q', 'white').class).to eql(Queen)
      end

      it 'dxe8=Q' do
        # Black king
        @empty_chess.board[0][2].piece = King.new('black', [0,4])
        @empty_chess.board[0][2].piece.position = [0,2]
        # White king
        @empty_chess.board[0][0].piece = King.new('white', [7,4])
        @empty_chess.board[0][0].piece.position = [0, 0]

        @empty_chess.board[1][3].piece = Pawn.new('white', [6, 3])
        @empty_chess.board[1][3].piece.position = [1, 3]
        @empty_chess.board[0][4].piece = Rook.new('black', [0, 7])
        @empty_chess.board[0][4].piece.position = [0, 4]
        @empty_chess.update_possible_movement_all_pieces
        
        expect(@empty_chess.move('dxe8=Q', 'white').class).to eql(Queen)
      end
    end
    context 'castling' do
      context 'check' do
        it "White kingside (O-O) castling, It's possible to castling" do
          @empty_chess.board[7][7].piece = Rook.new('white', [7, 7])
          @empty_chess.board[7][4].piece = King.new('white', [7, 4])
          
          
          rook = @empty_chess.board[7][7].piece
          expect(@empty_chess.short_castling?(rook)).to eql(true)
        end

        it "Black kingside (O-O) castling, It's possible to castling" do
          @empty_chess.board[0][7].piece = Rook.new('black', [0, 0])
          @empty_chess.board[0][4].piece = King.new('black', [0, 4])
          
          
          rook = @empty_chess.board[0][7].piece
          expect(@empty_chess.short_castling?(rook)).to eql(true)
        end

        it "White queenside (O-O-O) castling, It's possible to castling" do
          @empty_chess.board[7][0].piece = Rook.new('white', [7, 0])
          @empty_chess.board[7][4].piece = King.new('white', [7, 4])
          
          
          rook = @empty_chess.board[7][0].piece
          expect(@empty_chess.long_castling?(rook)).to eql(true)
        end

        it "Black queenside (O-O-O) castling, It's possible to castling" do
          @empty_chess.board[0][0].piece = Rook.new('black', [0, 0])
          @empty_chess.board[0][4].piece = King.new('black', [0, 4])
          
          
          rook = @empty_chess.board[0][0].piece

          expect(@empty_chess.long_castling?(rook)).to eql(true)
        end

        it 'White kingside (O-O) castling. Black queen control g1. Kingside castling is not possible' do
          @empty_chess.board[7][7].piece = Rook.new('white', [7, 7])
          @empty_chess.board[7][4].piece = King.new('white', [7, 4])
          @empty_chess.board[4][6].piece = Queen.new('black', [0, 3])
          @empty_chess.board[4][6].piece.position = [4, 6]
          @empty_chess.update_possible_movement_all_pieces
          rook = @empty_chess.board[7][7].piece
          expect(@empty_chess.short_castling?(rook)).to eql(false)
        end

        it 'White queenside (O-O-O) castling. Black queen control g1. Queenside castling is possible' do
          @empty_chess.board[7][0].piece = Rook.new('white', [7, 0])
          @empty_chess.board[7][4].piece = King.new('white', [7, 4])
          @empty_chess.board[4][6].piece = Queen.new('black', [0, 3])
          @empty_chess.board[4][6].piece.position = [4, 6]
          @empty_chess.update_possible_movement_all_pieces
          rook = @empty_chess.board[7][0].piece
          expect(@empty_chess.long_castling?(rook)).to eql(false)
        end

        it 'White kingside (O-O) castling. Black queen control g1. Kingside castling is not possible' do
          @empty_chess.board[7][7].piece = Rook.new('white', [7, 7])
          @empty_chess.board[7][4].piece = King.new('white', [7, 4])
          @empty_chess.board[1][6].piece = Queen.new('black', [0, 3])
          @empty_chess.board[1][6].piece.position = [1, 6]
          @empty_chess.update_possible_movement_all_pieces
          rook = @empty_chess.board[7][7].piece
          expect(@empty_chess.short_castling?(rook)).to eql(false)
        end

        it 'White queenside (O-O-O) castling. Black queen control g1. Queenside castling is possible' do
          @empty_chess.board[7][0].piece = Rook.new('white', [7, 0])
          @empty_chess.board[7][4].piece = King.new('white', [7, 4])
          @empty_chess.board[1][6].piece = Queen.new('black', [0, 3])
          @empty_chess.board[1][6].piece.position = [1, 6]
          @empty_chess.update_possible_movement_all_pieces
          rook = @empty_chess.board[7][0].piece
          expect(@empty_chess.long_castling?(rook)).to eql(true)
        end

        it "Black kingside (O-O) castling. Black king is in check, it's not possible to castling" do
          @empty_chess.board[0][7].piece = Rook.new('black', [0, 0])
          @empty_chess.board[0][4].piece = King.new('black', [0, 4])
          @empty_chess.board[3][1].piece = Queen.new('white', [7, 3])
          @empty_chess.board[3][1].piece.position = [3, 1]
          @empty_chess.update_possible_movement_all_pieces

          rook = @empty_chess.board[0][7].piece
          expect(@empty_chess.short_castling?(rook)).to eql(false)
        end

        it "Black queenside (O-O-O) castling. Black king is in check, it's not possible to castling" do
          @empty_chess.board[0][0].piece = Rook.new('black', [0, 0])
          @empty_chess.board[0][4].piece = King.new('black', [0, 4])
          @empty_chess.board[3][1].piece = Queen.new('white', [7, 3])
          @empty_chess.board[3][1].piece.position = [3, 1]
          @empty_chess.update_possible_movement_all_pieces

          rook = @empty_chess.board[0][0].piece
          expect(@empty_chess.long_castling?(rook)).to eql(false)
        end
      end
      context 'movement' do
        it 'White kingside (O-O) castling' do
          @empty_chess.board[7][7].piece = Rook.new('white', [7, 7])
          @empty_chess.board[7][4].piece = King.new('white', [7, 4])
          
          
          rook = @empty_chess.board[7][7].piece
          expect(@empty_chess.move('O-O', 'white')).to eql(rook)
        end

        it 'Black kingside (O-O) castling' do
          @empty_chess.board[0][7].piece = Rook.new('black', [0, 0])
          @empty_chess.board[0][4].piece = King.new('black', [0, 4])
          
          
          rook = @empty_chess.board[0][7].piece
          expect(@empty_chess.move('O-O', 'black')).to eql(rook)
        end

        it 'White queenside (O-O-O) castling' do
          @empty_chess.board[7][0].piece = Rook.new('white', [7, 0])
          @empty_chess.board[7][4].piece = King.new('white', [7, 4])
          
          
          rook = @empty_chess.board[7][0].piece
          expect(@empty_chess.move('O-O-O', 'white')).to eql(rook)
        end

        it 'Black queenside (O-O-O) castling' do
          @empty_chess.board[0][0].piece = Rook.new('black', [0, 0])
          @empty_chess.board[0][4].piece = King.new('black', [0, 4])
          
          
          rook = @empty_chess.board[0][0].piece
          expect(@empty_chess.move('O-O-O', 'black')).to eql(rook)
        end

        it 'White kingside (O-O) castling. Black queen control g1. Kingside castling is not possible' do
          @empty_chess.board[7][7].piece = Rook.new('white', [7, 7])
          @empty_chess.board[7][4].piece = King.new('white', [7, 4])
          @empty_chess.board[4][6].piece = Queen.new('black', [0, 3])
          @empty_chess.board[4][6].piece.position = [4, 6]
          @empty_chess.update_possible_movement_all_pieces
          expect(@empty_chess.move('O-O', 'white')).to eql(nil)
        end

        it 'White queenside (O-O-O) castling. Black queen control g1 and d1. Queenside castling is not possible' do
          @empty_chess.board[7][0].piece = Rook.new('white', [7, 0])
          @empty_chess.board[7][4].piece = King.new('white', [7, 4])
          @empty_chess.board[4][6].piece = Queen.new('black', [0, 3])
          @empty_chess.board[4][6].piece.position = [4, 6]
          @empty_chess.update_possible_movement_all_pieces
          expect(@empty_chess.move('O-O-O', 'white')).to eql(nil)
        end

        it 'White kingside (O-O) castling. Black queen control g1. Kingside castling is not possible' do
          @empty_chess.board[7][7].piece = Rook.new('white', [7, 7])
          @empty_chess.board[7][4].piece = King.new('white', [7, 4])
          @empty_chess.board[1][6].piece = Queen.new('black', [0, 3])
          @empty_chess.board[1][6].piece.position = [1, 6]
          @empty_chess.update_possible_movement_all_pieces
          expect(@empty_chess.move('O-O', 'white')).to eql(nil)
        end

        it 'White queenside (O-O-O) castling. Black queen control g1. Queenside castling is possible' do
          @empty_chess.board[7][0].piece = Rook.new('white', [7, 0])
          @empty_chess.board[7][4].piece = King.new('white', [7, 4])
          @empty_chess.board[1][6].piece = Queen.new('black', [0, 3])
          @empty_chess.board[1][6].piece.position = [1, 6]
          @empty_chess.update_possible_movement_all_pieces
          rook = @empty_chess.board[7][0].piece
          expect(@empty_chess.move('O-O-O', 'white')).to eql(rook)
        end

        it "Black kingside (O-O) castling. Black king is in check, it's not possible to castling" do
          @empty_chess.board[0][7].piece = Rook.new('black', [0, 0])
          @empty_chess.board[0][4].piece = King.new('black', [0, 4])
          @empty_chess.board[3][1].piece = Queen.new('white', [7, 3])
          @empty_chess.board[3][1].piece.position = [3, 1]
          @empty_chess.update_possible_movement_all_pieces

          expect(@empty_chess.move('O-O', 'black')).to eql(nil)
        end

        it "Black queenside (O-O-O) castling. Black king is in check, it's not possible to castling" do
          @empty_chess.board[0][0].piece = Rook.new('black', [0, 0])
          @empty_chess.board[0][4].piece = King.new('black', [0, 4])
          @empty_chess.board[3][1].piece = Queen.new('white', [7, 3])
          @empty_chess.board[3][1].piece.position = [3, 1]
          @empty_chess.update_possible_movement_all_pieces

          expect(@empty_chess.move('O-O-O', 'black')).to eql(nil)
        end
      end
    end
  end
end
