require_relative 'square'
require_relative 'pawn'
require_relative 'rook'
require_relative 'knight'
require_relative 'bishop'
require_relative 'king'
require_relative 'queen'

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

  def draw_board
    
    @board.each do |row|
      row.each do |value| 
        if value.piece.nil?
          print "."
        else
          print value.piece.SYMBOL
        end
      end
      puts
    end

  end

  def initialize_board

    board = Array.new(8) {Array.new(8)}

    

    
    letters = ['A', 'B', 'C', 'D', 'E' , 'F', 'G', 'H']
    numbers = (1..8).to_a.reverse
   
    numbers.each_with_index do |number, number_index|
      letters.each_with_index do |letter, letter_index|
        board[number_index][letter_index] = Square.new(letter + number.to_s)
      end
    end

    initialize_pawns(board)
    initialize_rooks(board)
    initialize_knights(board)
    initialize_bishops(board)
    initialize_kings(board)
    initialize_queens(board)
    board.each do |row|
      row.each do |square|
        square.piece.generate_possible_movement(board) unless square.piece.nil?
      end
    end


    board
  end

  def initialize_kings(board)
    board[0][4].piece = King.new('black', [0,4])
    board[7][4].piece = King.new('white', [7,4])
  end

  def initialize_queens(board)
    board[0][3].piece = Queen.new('black', [0,3])
    board[7][3].piece = Queen.new('white', [7,3])
  end

  def initialize_bishops(board)
    board[0][2].piece = Bishop.new('black', [0,2])
    board[0][5].piece = Bishop.new('black', [0,5])
    board[7][2].piece = Bishop.new('white', [7,2])
    board[7][5].piece = Bishop.new('white', [7,5])
  end

  def initialize_knights(board)
    board[0][1].piece = Knight.new('black', [0,1])
    board[0][6].piece = Knight.new('black', [0,6])
    board[7][1].piece = Knight.new('white', [7,1])
    board[7][6].piece = Knight.new('white', [7,6])
  end

  def initialize_rooks(board)
    board[0][0].piece = Rook.new('black',[0,0])
    board[0][7].piece = Rook.new('black', [0,7])
    board[7][0].piece = Rook.new('white', [7,0])
    board[7][7].piece = Rook.new('white',[7,7])
  end

  def initialize_pawns(board)
    8.times { |index| board[1][index].piece = Pawn.new('black', [1, index]) }
    8.times { |index| board[6][index].piece = Pawn.new('white', [6, index]) }
  end

end

chess = Chess.new

# chess.board.each do |row|
#   p row
#   puts
# end

chess.draw_board

pawn = Pawn.new('white', [1,6])

# p pawn.possible_movement
#p Pawn.MOVEMENT_WHITE


