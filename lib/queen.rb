class Queen < Piece

  @@SYMBOLS = {white: "\u2655", black: "\u265B" }
  @@MOVEMENT  = [
    [-7, 0], [-6, 0], [-5, 0], [-4, 0], [-3, 0], [-2, 0], [-1, 0],
    [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0],
    [0, -7], [0, -6], [0, -5], [0, -4], [0, -3], [0, -2], [0, -1],
    [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7],
    [1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7],
    [-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7],
    [-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7],
    [1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7]]
  
    def initialize(color, initial_position)
      super(color, initial_position)
      @SYMBOL = @@SYMBOLS[color]
    end

end