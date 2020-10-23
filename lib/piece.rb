class Piece
  attr_accessor :possible_movement, :position
  attr_reader :SYMBOL, :INITIAL_POSITION, :COLOR
  
  def initialize(color, initial_position)
    @SYMBOL
    @COLOR = color
    @INITIAL_POSITION = initial_position
    @position = @INITIAL_POSITION
  end

  def valid_mode?(x, y)
    return x.between?(0, 7) && y.between?(0, 7)
  end

  def possible_movement?(dest)
    return false if self.possible_movement.empty?
    self.possible_movement.any? do |coor|
      self.position[0] + coor[0] == dest[0] && self.position[1] + coor[1] == dest[1] 
    end
  end

end