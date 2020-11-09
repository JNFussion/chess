require_relative 'movement'

class Piece
  include Movement
  attr_accessor :possible_movement, :position, :turns
  attr_reader :SYMBOL, :INITIAL_POSITION, :COLOR, :MOVEMENT
  
  @@turns = {:black => 1, :white => 1}

  def initialize(color, initial_position)
    @SYMBOL
    @COLOR = color
    @INITIAL_POSITION = initial_position
    @position = @INITIAL_POSITION
    @possible_movement
    @MOVEMENT
  end

  def valid_mode?(x, y)
    return x.between?(0, 7) && y.between?(0, 7)
  end

  def generate_possible_movement(board)
    pos_mov = Array.new()
    @MOVEMENT.each{|e| pos_mov << e.dup}
    
    pos_mov.delete_if do |row| 
      row.delete_if {|coor| !valid_mode?(self.position[0] + coor[0],self.position[1] + coor[1])}
      row.empty?
    end
    
    pos_mov.map! do |row|
        aux = []
        row.each_with_index do |coor, index|
          unless board[coor[0] + self.position[0]][coor[1] + self.position[1]].piece.nil?
            aux = row[index+1..-1] if board[coor[0] + self.position[0]][coor[1] + self.position[1]].piece.COLOR != self.COLOR
            aux = row[index..-1] if board[coor[0] + self.position[0]][coor[1] + self.position[1]].piece.COLOR == self.COLOR
            break
          end
        end
        row = row - aux
    end

    pos_mov.delete_if {|row| row.empty?}
    @possible_movement = pos_mov.flatten(1)
  end


  def possible_movement?(dest)
    return false if self.possible_movement.empty?
    self.possible_movement.any? do |coor|
        self.position[0] + coor[0] == dest[0] && self.position[1] + coor[1] == dest[1]
    end
  end

  def self.turns
    @@turns
  end

  def turn
    @@turns[self.COLOR.to_sym]
  end

  def up_turn
    @@turns[self.COLOR.to_sym] += 1
  end
  
end