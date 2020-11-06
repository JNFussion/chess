require_relative 'piece'

class Rook < Piece
  include Movement
  
  @@SYMBOLS = {white: "\u2656", black: "\u265C" }
  

  def initialize(color, initial_position)
    super(color, initial_position)
    @SYMBOL = @@SYMBOLS[color.to_sym]
    @MOVEMENT = ROOK_MOVEMENT
  end
  
  def self.SYMBOLS
    @@SYMBOLS
  end

end