require_relative 'piece'

class Rook < Piece

  @@SYMBOLS = {white: "\u2656", black: "\u265C" }
  @@MOVEMENT = [
    [-7, 0], [-6, 0], [-5, 0], [-4, 0], [-3, 0], [-2, 0], [-1, 0],
    [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0],
    [0, -7], [0, -6], [0, -5], [0, -4], [0, -3], [0, -2], [0, -1],
    [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7]]


  def initialize(color, initial_position, board = nil)
    super(color, initial_position)
    @SYMBOL = @@SYMBOLS[color.to_sym]
    @possible_movement  = generate_possible_movement(board)
  end

  def generate_possible_movement(board)
    pos_mov = Array.new(@@MOVEMENT)
    
    pos_mov.delete_if {|coor| !valid_mode?(self.position[0] + coor[0],self.position[1] + coor[1] )}
    
    p self
    p pos_mov
    
    pos_mov
  end

  def self.MOVEMENT
    @@MOVEMENT
  end
end