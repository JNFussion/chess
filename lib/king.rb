require_relative 'piece'

class King < Piece

  @@SYMBOLS = {white: "\u2654", black: "\u265A" }
  @@MOVEMENT  = [[1, 1], [1, 0], [1, -1], [0, -1], [-1, -1], [-1, 0],[-1,1], [0,1]]

  def initialize(color, initial_position)
    super(color, initial_position)
    @SYMBOL = @@SYMBOLS[color.to_sym]
  end
  
  def generate_possible_movement(board)
    pos_mov = Array.new(King.MOVEMENT)

    pos_mov.delete_if {|coor| !valid_mode?(self.position[0] + coor[0],self.position[1] + coor[1])}
      
    pos_mov.delete_if do |coor| 
      board[coor[0] + self.position[0]][coor[1] + self.position[1]].piece.COLOR == self.COLOR unless board[coor[0] + self.position[0]][coor[1] + self.position[1]].piece.nil?
    end
    @possible_movement = pos_mov
  end

  def self.MOVEMENT
    @@MOVEMENT
  end
end