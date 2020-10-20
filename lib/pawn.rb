require_relative 'piece'

class Pawn < Piece

  @@SYMBOLS = {white: "\u2659", black: "\u265F" }
  @@MOVEMENT = [[1,0], [2, 0], [-1, 0], [-2, 0], [1,1], [1,-1], [-1,1], [-1,-1]]
  
  def initialize(color, initial_position)
    super(color, initial_position)
    @SYMBOL = @@SYMBOLS[color.to_sym]

  end

  def possible_movement(board)
    pos_mov = @@MOVEMENT.map do |cor|
      cor[0] = self.position[0] + cor[0]
      cor[1] = self.position[1] + cor[1]
    end
    #pos_mov.delete_if {|cor| valid_mode?(cor[0] + self.position[0], cor[1] + self.position[1]) }
    @@possible_movement = pos_mov
  end

end

# pawn = Pawn.new(:white, [0,6])

# p pawn.possible_movement(nil)