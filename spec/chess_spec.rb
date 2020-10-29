require '../lib/chess'
require 'pry'

describe 'Chess' do

  before {@chess = Chess.new}

  describe '#move' do
    context 'A8 Rook on inital board' do
      it 'A8 to A6 return nil' do
        expect(@chess.move_piece('A8', 'A6')).to eql(nil)
      end
      it 'A8 to B8 return nil' do
        expect(@chess.move_piece('A8', 'B8')).to eql(nil)
      end
      it 'A8 to G6 return nil' do
        expect(@chess.move_piece('A8', 'G8')).to eql(nil)
      end
      it 'A8 to G4 return nil' do
        expect(@chess.move_piece('A8', 'G4')).to eql(nil)
      end
    end
    context 'D4 Rook initial board' do
      
      it 'White rook: D4 to D2 return nil' do
        @chess.board[4][3].piece  = Rook.new('white',[4,3], Movement::ROOK_MOVEMENT)
        @chess.board[4][3].piece.generate_possible_movement(@chess.board)
        expect(@chess.move_piece('D4', 'D2')).to eql(nil)
      end

      it 'White rook: D4 to D7 return Rook' do
        @chess.board[4][3].piece  = Rook.new('white',[4,3], Movement::ROOK_MOVEMENT)
        @chess.board[4][3].piece.generate_possible_movement(@chess.board)
        expect(@chess.move_piece('D4', 'D7')).to eql(@chess.board[1][3].piece)
        
      end
      
      it 'White rook: D4 to B4 return Rook' do
        @chess.board[4][3].piece  = Rook.new('white',[4,3], Movement::ROOK_MOVEMENT)
        @chess.board[4][3].piece.generate_possible_movement(@chess.board)
        
        expect(@chess.move_piece('D4', 'B4')).to eql(@chess.board[4][1].piece)
        
      end

      it 'White rook: D4 to H4 return Rook' do
        @chess.board[4][3].piece  = Rook.new('white',[4,3], Movement::ROOK_MOVEMENT)
        @chess.board[4][3].piece.generate_possible_movement(@chess.board)
        expect(@chess.move_piece('D4', 'H4')).to eql(@chess.board[4][7].piece)
        
      end

      it 'Black rook: D4 to D2 return nil' do
        @chess.board[4][3].piece  = Rook.new('black',[4,3], Movement::ROOK_MOVEMENT)
        @chess.board[4][3].piece.generate_possible_movement(@chess.board)
        expect(@chess.move_piece('D4', 'D2')).to eql(@chess.board[6][3].piece)
      end

      it 'Black rook: D4 to D7 return Rook' do
        @chess.board[4][3].piece  = Rook.new('black',[4,3], Movement::ROOK_MOVEMENT)
        @chess.board[4][3].piece.generate_possible_movement(@chess.board)
        expect(@chess.move_piece('D4', 'D7')).to eql(nil)
        
      end
      
      it 'Black rook: D4 to B4 return Rook' do
        @chess.board[4][3].piece  = Rook.new('black',[4,3], Movement::ROOK_MOVEMENT)
        @chess.board[4][3].piece.generate_possible_movement(@chess.board)
        
        expect(@chess.move_piece('D4', 'B4')).to eql(@chess.board[4][1].piece)
        
      end

      it 'Black rook: D4 to H4 return Rook' do
        @chess.board[4][3].piece  = Rook.new('black',[4,3], Movement::ROOK_MOVEMENT)
        @chess.board[4][3].piece.generate_possible_movement(@chess.board)
        
        expect(@chess.move_piece('D4', 'H4')).to eql(@chess.board[4][7].piece)
        
      end
    end
  end

  describe '#correct_input?' do
    it 'Input: "asd" return false' do
      expect(@chess.correct_input?('asd')).to eql(false)
    end
    it 'Input: "123456789" return false' do
      expect(@chess.correct_input?('123456789')).to eql(false)
    end
    it 'Input: "as 12" return false' do
      expect(@chess.correct_input?('asd 123')).to eql(false)
    end
    it 'Input: "Z9 G1" return true' do
      expect(@chess.correct_input?('A2 A1')).to eql(true)
    end
    it 'Input: "A2A1" return false' do
      expect(@chess.correct_input?('A2A1')).to eql(false)
    end
    it 'Input: "A2 A1" return true' do
      expect(@chess.correct_input?('A2 A1')).to eql(true)
    end

    it 'Input: "A2 C8" return true' do
      expect(@chess.correct_input?('A2 C8')).to eql(true)
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
      expect(empty_chess.get_king('black')).to eql(nil)
    end
    
  end
end