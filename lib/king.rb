require_relative 'piece'

class King < Piece

  @@SYMBOLS = {white: "\u2654", black: "\u265A" }
  @@MOVEMENT  = [[1, 1], [1, 0], [1, -1], [0, -1], [-1, -1], [-1, 0],[-1,1], [0,1]]

  def initialize(color, initial_position)
    super(color, initial_position)
    @SYMBOL = @@SYMBOLS[color.to_sym]
  end

  def self.MOVEMENT
    @@MOVEMENT
  end
end