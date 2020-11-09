require_relative 'piece'

class Pawn < Piece
  include Movement

  @@SYMBOLS = {white: "\u2659", black: "\u265F" }

  def initialize(color, initial_position)
    super(color, initial_position)
    @MOVEMENT = color == 'white' ? PAWN_MOVEMENT_WHITE : PAWN_MOVEMENT_BLACK
    @SYMBOL = @@SYMBOLS[color.to_sym]
  end

  def generate_possible_movement(board)
    @possible_movement = possible_movement_white(board) if self.COLOR == 'white'
    @possible_movement = possible_movement_black(board) if self.COLOR == 'black'

    en_passant(board)
  end

  def possible_movement_white(board)
    pos_mov = Array.new(self.MOVEMENT)

    # Delete the positions out of the board 
    pos_mov.delete_if {|coor| !valid_mode?(self.position[0] + coor[0],self.position[1] + coor[1] )}
    # Delete the 2 square initial movement
    pos_mov.delete([-2,0]) if self.position != self.INITIAL_POSITION
    # Delete move forward if there is a piece
    pos_mov.delete([-1, 0]) unless valid_mode?(self.position[0] - 1, self.position[1]) && board[self.position[0] - 1][self.position[1]].piece.nil?
    # Delete move diagonal if there aren't black pieces
    pos_mov.delete([-1,-1]) if valid_mode?(self.position[0] - 1, self.position[1] - 1) && (board[self.position[0] - 1][self.position[1] - 1].piece.nil? || board[self.position[0] - 1][self.position[1] - 1].piece.COLOR != 'black')
    pos_mov.delete([-1,1]) if valid_mode?(self.position[0] - 1, self.position[1] + 1) && (board[self.position[0] - 1][self.position[1] + 1].piece.nil? || board[self.position[0] - 1][self.position[1] + 1].piece.COLOR != 'black')
    pos_mov
  end

  def possible_movement_black(board)
    pos_mov = Array.new(self.MOVEMENT)
    # Delete the positions out of the board 
    pos_mov.delete_if {|coor| !valid_mode?(self.position[0] + coor[0], self.position[1] + coor[1] )}
    # Delete the 2 square initial movement
    pos_mov.delete([2,0]) if self.position != self.INITIAL_POSITION
    # Delete move forward if there is a piece
    pos_mov.delete([1, 0]) unless valid_mode?(self.position[0] + 1, self.position[1]) && board[self.position[0] + 1][self.position[1]].piece.nil?
    # Delete move diagonal if there aren't black pieces
    pos_mov.delete([1,-1]) if valid_mode?(self.position[0] + 1, self.position[1] - 1) && (board[self.position[0] + 1][self.position[1] - 1].piece.nil? || board[self.position[0] + 1][self.position[1] - 1].piece.COLOR != 'white')
    pos_mov.delete([1,1]) if valid_mode?(self.position[0] + 1, self.position[1] + 1) && (board[self.position[0] + 1][self.position[1] + 1].piece.nil? || board[self.position[0] + 1][self.position[1] + 1].piece.COLOR != 'white')
    pos_mov
  end

  def en_passant(board)
    pos_mov = Array.new(self.MOVEMENT[-2..-1])
    
    #check left
    if valid_mode?(self.position[0], self.position[1] - 1) && !board[self.position[0]][self.position[1] - 1].piece.nil?
      piece_left = board[self.position[0]][self.position[1] - 1].piece
      pos_mov.shift unless piece_left.COLOR != self.COLOR && 
      piece_left.turn - 1 == self.turn && 
      piece_left.COLOR == 'black' ? piece_left.INITIAL_POSITION[0] == piece_left.position[0] - 2 && piece_left.INITIAL_POSITION[0] == piece_left.position[1] :
      piece_left.INITIAL_POSITION[0] == piece_left.position[0] + 2 && piece_left.INITIAL_POSITION[0] == piece_left.position[1]
    end
    
    # check right
    if valid_mode?(self.position[0], self.position[1] + 1) && !board[self.position[0]][self.position[1] + 1].piece.nil?
    piece_right = board[self.position[0]][self.position[1] + 1].piece
    pos_mov.shift unless piece_right.COLOR != self.COLOR && 
    piece_right.turn - 1 == self.turn && 
    piece_right.COLOR == 'black' ? piece_right.INITIAL_POSITION[0] == piece_right.position[0] - 2 && piece_right.INITIAL_POSITION[0] == piece_right.position[1] :
    piece_right.INITIAL_POSITION[0] == piece_right.position[0] + 2 && piece_right.INITIAL_POSITION[0] == piece_right.position[1]
    end
    return if pos_mov.size != 1
    @possible_movement + pos_mov if (@possible_movement - pos_mov).size == @possible_movement.size
  end

  def self.SYMBOLS
    @@SYMBOLS
  end

end