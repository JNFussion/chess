require_relative 'piece'

class Queen < Piece

  @@SYMBOLS = {white: "\u2655", black: "\u265B" }
  
    def initialize(color, initial_position, movement)
      super(color, initial_position, movement)
      @SYMBOL = @@SYMBOLS[color.to_sym]
    end

end