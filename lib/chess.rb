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
    initialize_rooks(board)
    initialize_knights(board)
    initialize_bishops(board)
    initialize_kings(board)
    initialize_queens(board)

    board
  end

  def initialize_kings(board)
    board['E8'].piece = King.new('black', board['E8'].position)
    board['E1'].piece = King.new('white', board['E1'].position)
  end

  def initialize_queens(board)
    board['D8'].piece = Queen.new('black', board['D8'].position)
    board['D1'].piece = Queen.new('white', board['D1'].position)
  end

  def initialize_bishops(board)
    board['C8'].piece = Bishop.new('black', board['C8'].position)
    board['F8'].piece = Bishop.new('black', board['F8'].position)
    board['C1'].piece = Bishop.new('white', board['C1'].position)
    board['F1'].piece = Bishop.new('white', board['F1'].position)
  end

  def initialize_knights(board)
    board['B8'].piece = Knight.new('black', board['B8'].position)
    board['G8'].piece = Knight.new('black', board['G8'].position)
    board['B1'].piece = Knight.new('white', board['B1'].position)
    board['G1'].piece = Knight.new('white', board['G1'].position)
  end

  def initialize_rooks(board)
    board['A8'].piece = Rook.new('black', board['A8'].position)
    board['H8'].piece = Rook.new('black', board['H8'].position)
    board['A1'].piece = Rook.new('white', board['A1'].position)
    board['H1'].piece = Rook.new('white',board['H1'].position)
  end

  def initialize_pawns(color, letters, board)
    letters.each do |letter|
      square = color == 'white' ? board[letter + '2'] : board[letter + '7']
      square.piece = Pawn.new(color, square.position) 
    end
  end

end

chess = Chess.new
chess.draw_board
p chess.board
