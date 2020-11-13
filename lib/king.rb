require_relative 'piece'

class King < Piece

  @@SYMBOLS = {white: "\u2654", black: "\u265A" }

  attr_accessor :number_of_move

  def initialize(color, initial_position)
    super(color, initial_position)
    @SYMBOL = @@SYMBOLS[color.to_sym]
    @MOVEMENT = KING_MOVEMENT
    @number_of_move = 0
  end

  def generate_possible_movement(board)
    pos_mov = Array.new(@MOVEMENT)

    pos_mov.delete_if {|coor| !valid_mode?(self.position[0] + coor[0],self.position[1] + coor[1])}
    
    # Delete if piece in the possible movement is the same color.

    pos_mov.delete_if do |coor| 
      board[coor[0] + self.position[0]][coor[1] + self.position[1]].piece.COLOR == self.COLOR unless board[coor[0] + self.position[0]][coor[1] + self.position[1]].piece.nil?
    end

    @possible_movement = pos_mov
  end

  def check?(pieces)

    pieces.any? do |piece|
      piece.possible_movement.any? do |pos|
        pos[0] + piece.position[0] == self.position[0] && pos[1] + piece.position[1] == self.position[1]
      end
    end
  end

  def self.SYMBOLS
    @@SYMBOLS
  end

  # private

end