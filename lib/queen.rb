require_relative 'piece'

class Queen < Piece
  include Movement

  @@SYMBOLS = {white: "\u2655", black: "\u265B" }
  
    def initialize(color, initial_position)
      super(color, initial_position)
      @SYMBOL = @@SYMBOLS[color.to_sym]
      @MOVEMENT = QUEEN_MOVEMENT
    end

    def self.SYMBOLS
      @@SYMBOLS
    end

end