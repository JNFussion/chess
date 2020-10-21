require_relative 'piece'

class Rook < Piece

  @@SYMBOLS = {white: "\u2656", black: "\u265C" }
  @@MOVEMENT = [
    [-7, 0], [-6, 0], [-5, 0], [-4, 0], [-3, 0], [-2, 0], [-1, 0],
    [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0],
    [0, -7], [0, -6], [0, -5], [0, -4], [0, -3], [0, -2], [0, -1],
    [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7]]


  def initialize(color, initial_position)
    super(color, initial_position)
    @SYMBOL = @@SYMBOLS[color.to_sym]
  end

  def self.MOVEMENT
    @@MOVEMENT
  end
end