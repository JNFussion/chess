require_relative 'piece'

class Pawn < Piece

  @@SYMBOLS = {white: "\u2659", black: "\u265F" }

  def initialize(color, initial_position, movement)
    super(color, initial_position, movement)
    @SYMBOL = @@SYMBOLS[color.to_sym]
  end

  def generate_possible_movement(board)
    @possible_movement = possible_movement_white(board) if self.COLOR == 'white'
    @possible_movement = possible_movement_black(board) if self.COLOR == 'black'
  end

  def possible_movement_white(board)
    pos_mov = Array.new(self.MOVEMENT)

    # Delete the positions out of the board 
    pos_mov.delete_if {|coor| !valid_mode?(self.position[0] + coor[0],self.position[1] + coor[1] )}
    # Delete the 2 square initial movement
    pos_mov.delete([-2,0]) if self.position != self.INITIAL_POSITION
    # Delete move forward if there is a piece
    pos_mov.delete([-1, 0]) unless board[self.position[0] - 1][self.position[1]].piece.nil?
    # Delete move diagonal if there aren't black pieces
    pos_mov.delete([-1,-1]) if valid_mode?(self.position[0] - 1, self.position[1] - 1) && (board[self.position[0] - 1][self.position[1] - 1].piece.nil? || board[self.position[0] - 1][self.position[1] - 1].piece.COLOR == 'black')
    pos_mov.delete([-1,1]) if valid_mode?(self.position[0] - 1, self.position[1] + 1) && (board[self.position[0] - 1][self.position[1] + 1].piece.nil? || board[self.position[0] - 1][self.position[1] + 1].piece.COLOR == 'black')
    pos_mov
  end

  def possible_movement_black(board)
    pos_mov = Array.new(self.MOVEMENT)
    # Delete the positions out of the board 
    pos_mov.delete_if {|coor| !valid_mode?(self.position[0] + coor[0], self.position[1] + coor[1] )}
    # Delete the 2 square initial movement
    pos_mov.delete([2,0]) if self.position != self.INITIAL_POSITION
    # Delete move forward if there is a piece
    pos_mov.delete([1, 0]) unless board[self.position[0] + 1][self.position[1]].piece.nil?
    
    # Delete move diagonal if there aren't black pieces
    pos_mov.delete([1,-1]) if valid_mode?(self.position[0] + 1, self.position[1] - 1) && (board[self.position[0] + 1][self.position[1] - 1].piece.nil? || board[self.position[0] + 1][self.position[1] - 1].piece.COLOR == 'white')
    pos_mov.delete([1,1]) if valid_mode?(self.position[0] + 1, self.position[1] + 1) && (board[self.position[0] + 1][self.position[1] + 1].piece.nil? || board[self.position[0] + 1][self.position[1] + 1].piece.COLOR == 'white')
    pos_mov
  end

end