class Piece
  attr_accessor :possible_movement, :position
  attr_reader :SYMBOL, :INITIAL_POSITION, :COLOR
  
  def initialize(color, initial_position)
    @SYMBOL
    @COLOR = color
    @INITIAL_POSITION = initial_position
    @position = @INITIAL_POSITION
    @possible_movement
  end

  def valid_mode?(x, y)
    return x.between?(0, 7) && y.between?(0, 7)
  end

end