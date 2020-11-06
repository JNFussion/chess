require_relative 'piece'

class Bishop < Piece
  include Movement

  @@SYMBOLS = {white: "\u2657", black: "\u265D" }
 
    def initialize(color, initial_position)
      super(color, initial_position)
      @SYMBOL = @@SYMBOLS[color.to_sym]
      @MOVEMENT = BISHOP_MOVEMENT
    end
    
    def self.SYMBOLS
      @@SYMBOLS
    end
end