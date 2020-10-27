require_relative 'piece'

class Bishop < Piece

  @@SYMBOLS = {white: "\u2657", black: "\u265D" }
 
    def initialize(color, initial_position, movement)
      super(color, initial_position, movement)
      @SYMBOL = @@SYMBOLS[color.to_sym]
    end

end