require_relative 'piece'

class Queen < Piece

  @@SYMBOLS = {white: "\u2655", black: "\u265B" }
  @@MOVEMENT  = [
    [[-7, 0], [-6, 0], [-5, 0], [-4, 0], [-3, 0], [-2, 0], [-1, 0]],
    [[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0]],
    [[0, -7], [0, -6], [0, -5], [0, -4], [0, -3], [0, -2], [0, -1]],
    [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7]],
    [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7]],
    [[-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7]],
    [[-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7]],
    [[1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7]]]
  
    def initialize(color, initial_position)
      super(color, initial_position)
      @SYMBOL = @@SYMBOLS[color.to_sym]
    end

    def generate_possible_movement(board)
      pos_mov = Array.new()
      Queen.MOVEMENT.each{|e| pos_mov << e.dup}
      
      pos_mov.delete_if do |row|
        row.delete_if {|coor| !valid_mode?(self.position[0] + coor[0], self.position[1] + coor[1])}
        row.empty?
      end
      
      pos_mov.map! do |row|
        aux = []
        row.each_with_index do |coor, index|
          unless board[coor[0] + self.position[0]][coor[1] + self.position[1]].piece.nil?
            
            if index.zero?
              aux = row
              break
            end

            aux = row[index..-1] if board[coor[0] + self.position[0]][coor[1] + self.position[1]].piece.COLOR != self.COLOR
            
            aux = row[index-1..-1] if board[coor[0] + self.position[0]][coor[1] + self.position[1]].piece.COLOR == self.COLOR
              
            break
          end
        end
        row = row - aux
      end
      pos_mov.delete_if {|row| row.empty?}
      @possible_movement = pos_mov
    end

    def self.MOVEMENT
      @@MOVEMENT
    end

end