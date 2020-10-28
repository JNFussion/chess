require_relative 'piece'

class King < Piece

  @@SYMBOLS = {white: "\u2654", black: "\u265A" }

  def initialize(color, initial_position, movement)
    super(color, initial_position, movement)
    @SYMBOL = @@SYMBOLS[color.to_sym]
  end
  
  def generate_possible_movement(board)
    pos_mov = Array.new(self.MOVEMENT)

    pos_mov.delete_if {|coor| !valid_mode?(self.position[0] + coor[0],self.position[1] + coor[1])}
      
    pos_mov.delete_if do |coor| 
      board[coor[0] + self.position[0]][coor[1] + self.position[1]].piece.COLOR == self.COLOR unless board[coor[0] + self.position[0]][coor[1] + self.position[1]].piece.nil?
    end
    @possible_movement = pos_mov
  end

  def check?(pieces)
    pieces.any? do |piece|
      piece.possible_movement.any? do |pos_mov|
        piece.position[0] + pos_mov[0] == self.position[0] && piece.position[1] + pos_mov[1] == self.position[1]
      end
    end
  end

end