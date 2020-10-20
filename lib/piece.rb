class Piece
  attr_reader :SYMBOL
  def initialize
    @SYMBOL
    @COLOR
    @INITIAL_POSITION
    @position = @INITIAL_POSITION
    @possible_movement
  end
end

class Rook
  @@SYMBOLS = {white: "\u2656", black: "\u265C" }
  @@MOVEMENT = [
    [-7, 0], [-6, 0], [-5, 0], [-4, 0], [-3, 0], [-2, 0], [-1, 0],
    [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0],
    [0, -7], [0, -6], [0, -5], [0, -4], [0, -3], [0, -2], [0, -1],
    [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7]]


  def initialize
    movement
  end

  def self.MOVEMENT
    @@MOVEMENT
  end
end

class Bishop

  @@SYMBOLS = {white: "\u2657", black: "\u265D" }
  @@MOVEMENT = [
    [1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7],
    [-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7],
    [-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7],
    [1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7]]

  def initialize
    
  end
end

class Queen
  @
  def initialize
    
  end
end

class King < Piece

  @@SYMBOLS = {white: "\u2654", black: "\u265A" }
  @@MOVEMENT  = [[1, 1], [1, 0], [1, -1], [0, -1], [-1, -1], [-1, 0],[-1,1], [0,1]]

  def initialize(color)
    @SYMBOL = @@SYMBOLS[color]
  end

  def self.MOVEMENT
    @@MOVEMENT
  end
end