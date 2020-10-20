class Pawn < Piece

  @@SYMBOLS = {white: "\u2659", black: "\u265F" }
  @@MOVEMENT = [[1,0], [2, 0], [-1, 0], [-2, 0], [1,1], [1,-1], [-1,1], [-1,-1]]
  
  def initialize(color, initial_position)
    super(color, initial_position)
    @SYMBOL = @@SYMBOLS[color]
  end
end