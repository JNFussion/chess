require_relative 'piece'

class Pawn < Piece

  @@SYMBOLS = {white: "\u2659", black: "\u265F" }
  @@MOVEMENT = [[1,0], [2, 0], [-1, 0], [-2, 0], [1,1], [1,-1], [-1,1], [-1,-1]]
  
  def initialize(color, initial_position)
    super(color, initial_position)
    @SYMBOL = @@SYMBOLS[color.to_sym]

  end

  def possible_movement(board)
    pos_mov = @@MOVEMENT
    pos_mov.delete_if {|coor| !valid_mode?(self.position[0] + coor[0],self.position[1] + coor[1] )}
    
    # delete de 2 squre move
    pos_mov.delete([2,0]) if self.position != self.initial_position
    pos_mov.delete([-2,0]) if self.position != self.initial_position

    @@possible_movement = pos_mov
  end

end