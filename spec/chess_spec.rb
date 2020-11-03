require '../lib/chess'
require 'pry'

describe 'Chess' do

  before {@chess = Chess.new}
  before {@empty_chess = Chess.new(false)}

  describe '#move' do
    context 'a8 Rook on inital board' do
      it 'a8 to a6 return nil' do
        expect(@chess.move_piece('a8', 'a6')).to eql(nil)
      end
      it 'a8 to b8 return nil' do
        expect(@chess.move_piece('a8', 'b8')).to eql(nil)
      end
      it 'a8 to g6 return nil' do
        expect(@chess.move_piece('a8', 'g6')).to eql(nil)
      end
      it 'a8 to g4 return nil' do
        expect(@chess.move_piece('a8', 'g4')).to eql(nil)
      end
    end
    context 'd4 Rook initial board' do
      
      it 'White rook: d4 to d2 return nil' do
        @chess.board[4][3].piece  = Rook.new('white',[4,3], Movement::ROOK_MOVEMENT)
        @chess.board[4][3].piece.generate_possible_movement(@chess.board)
        expect(@chess.move_piece('d4', 'd2')).to eql(nil)
      end

      it 'White rook: d4 to d7 return Rook' do
        @chess.board[4][3].piece  = Rook.new('white',[4,3], Movement::ROOK_MOVEMENT)
        @chess.board[4][3].piece.generate_possible_movement(@chess.board)
        expect(@chess.move_piece('d4', 'd7')).to eql(@chess.board[1][3].piece)
        
      end
      
      it 'White rook: d4 to b4 return Rook' do
        @chess.board[4][3].piece  = Rook.new('white',[4,3], Movement::ROOK_MOVEMENT)
        @chess.board[4][3].piece.generate_possible_movement(@chess.board)
        
        expect(@chess.move_piece('d4', 'b4')).to eql(@chess.board[4][1].piece)
        
      end

      it 'White rook: d4 to h4 return Rook' do
        @chess.board[4][3].piece  = Rook.new('white',[4,3], Movement::ROOK_MOVEMENT)
        @chess.board[4][3].piece.generate_possible_movement(@chess.board)
        expect(@chess.move_piece('d4', 'h4')).to eql(@chess.board[4][7].piece)
        
      end

      it 'Black rook: d4 to d2 return nil' do
        @chess.board[4][3].piece  = Rook.new('black',[4,3], Movement::ROOK_MOVEMENT)
        @chess.board[4][3].piece.generate_possible_movement(@chess.board)
        expect(@chess.move_piece('d4', 'd2')).to eql(@chess.board[6][3].piece)
      end

      it 'Black rook: d4 to d7 return Rook' do
        @chess.board[4][3].piece  = Rook.new('black',[4,3], Movement::ROOK_MOVEMENT)
        @chess.board[4][3].piece.generate_possible_movement(@chess.board)
        expect(@chess.move_piece('d4', 'd7')).to eql(nil)
        
      end
      
      it 'Black rook: d4 to b4 return Rook' do
        @chess.board[4][3].piece  = Rook.new('black',[4,3], Movement::ROOK_MOVEMENT)
        @chess.board[4][3].piece.generate_possible_movement(@chess.board)
        
        expect(@chess.move_piece('d4', 'b4')).to eql(@chess.board[4][1].piece)
        
      end

      it 'Black rook: d4 to H4 return Rook' do
        @chess.board[4][3].piece  = Rook.new('black',[4,3], Movement::ROOK_MOVEMENT)
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
    it 'Input: "Nf3" return true' do
      expect(@chess.correct_input?('Nf3')).to eql(true)
    end
    it 'Input: "c5" return true' do
      expect(@chess.correct_input?('c5')).to eql(true)
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

  describe '#get_king' do
    it 'Get white king' do
      expect(@chess.get_king('white')).to eql(@chess.board[7][4].piece)
    end

    it 'Get black King' do
      expect(@chess.get_king('black')).to eql(@chess.board[0][4].piece)
    end

    it 'There is no white king' do
      empty_chess = Chess.new(false)
      expect(empty_chess.get_king('white')).to eql(nil)
    end

    it 'There is no white king' do
      empty_chess = Chess.new(false)
      expect(@empty_chess.get_king('black')).to eql(nil)
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

  describe '#get_piece_by_notation' do
    it 'a8: return rook' do
      expect(@chess.get_piece_by_notation('a8')).to eql(@chess.board[0][0].piece)
    end
    it 'e8: return king' do
      expect(@chess.get_piece_by_notation('e8')).to eql(@chess.board[0][4].piece)
    end
    it 'c2: return pawn' do
      expect(@chess.get_piece_by_notation('c2')).to eql(@chess.board[6][2].piece)
    end
    it 'd4: return nil' do
      expect(@chess.get_piece_by_notation('d4')).to eql(@chess.board[4][3].piece)
    end
  end

  describe '#move' do
    
    it 'Be5' do
      @empty_chess.board[1][6].piece = Bishop.new('black',[0,5],Movement::BISHOP_MOVEMENT)
      @empty_chess.board[1][6].piece.position = [1, 6]
      @empty_chess.board[1][6].piece.generate_possible_movement(@empty_chess.board)
      expect(@empty_chess.move('Be5', 'black')).to eql(@empty_chess.board[3][4])
    end

    it 'c5' do
      expect(@chess.move('c5', 'blakc')).to eql(@chess.board[3][2])
    end
    it 'Bxe5' do
      @empty_chess.board[1][6].piece = Bishop.new('black',[0,5],Movement::BISHOP_MOVEMENT)
      @empty_chess.board[1][6].piece.position = [1, 6]
      @empty_chess.board[1][6].piece.generate_possible_movement(@empty_chess.board)
      @empty_chess.board[3][4].piece = Pawn.new('white',[6,4], Movement::PAWN_MOVEMENT_WHITE)
      @empty_chess.board[3][4].position = [3,4]
      @empty_chess.board[3][4].generate_possible_movement(@empty_chess.board)
      expect(@empty_chess.move('Bxe5', 'black')).to eql(@empty_chess.board[3][4])
    end
    it 'exd5' do
    end
    it 'exd6e.p' do
    end
    it 'Bdb8' do
    end
    it 'R1a3' do
    end
    it 'Qh4e1'do
      
    end
    it 'Qh4xe1' do
      
    end
  end
end