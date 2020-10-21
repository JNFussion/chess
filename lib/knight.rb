require_relative 'piece'

class Knight < Piece

  @@SYMBOLS = {white: "\u2658", black: "\u265E" }
  @@MOVEMENT = [[1,2],[2,1],[-1,2],[-2,1],[-2,-1],[-1,-2],[1,-2],[2,-1]]

  def initialize(color, initial_position)
    super(color, initial_position)
    @SYMBOL = @@SYMBOLS[color.to_sym]
  end

  def self.MOVEMENT
    @@MOVEMENT
  end

end