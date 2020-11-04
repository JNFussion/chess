require_relative 'piece'

class Rook < Piece

  @@SYMBOLS = {white: "\u2656", black: "\u265C" }
  

  def initialize(color, initial_position, movement)
    super(color, initial_position, movement)
    @SYMBOL = @@SYMBOLS[color.to_sym]
  end
  
  def self.SYMBOLS
    @@SYMBOLS
  end

end