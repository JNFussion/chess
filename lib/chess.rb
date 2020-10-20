require_relative 'square'
require_relative 'pawn'

class Chess
  attr_reader :board
  def initialize
    @board = self.initialize_board
  end

  def menu
    puts "MENU"
    puts "1. Play game."
    puts "2. Save game."
    puts "3. Load game."

  end

  def initialize_board
    board  = Hash.new
    letters = ['A', 'B', 'C', 'D', 'E' , 'F', 'G', 'H']
    numbers = (1..8).to_a.reverse
    row = 8
    numbers.each do |number|
      column = 1
      letters.each do |letter|
        key = letter + number.to_s
        board[key] = Square.new([row, column])
        column += 1
      end
      row -= 1
    end

    initialize_pawns('black', letters, board)

    initialize_pawns('white', letters, board)

    board
  end

  def initialize_pawns(color, letters, board)
    letters.each do |letter|
      square = color == 'white' ? board[letter + '2'] : board[letter + '7']
      square.piece = Pawn.new(color, square.position) 
    end
  end

  def draw_board
    index = 1
    @board.each_value do |value|
       if value.piece.nil?
        print "."
      else
        print value.piece.SYMBOL
      end
      puts if index%8 == 0
      index += 1
    end

  end
end

chess = Chess.new
chess.draw_board
p chess.board
