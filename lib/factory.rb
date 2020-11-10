module Factory

  def generate_full_board(full)
    board =  generate_board()
    return board unless full
   
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

  def generate_board

    board = Array.new(8) {Array.new(8)}

    letters = ['a', 'b', 'c', 'd', 'e' , 'f', 'g', 'h']
    numbers = (1..8).to_a.reverse
   
    numbers.each_with_index do |number, number_index|
      letters.each_with_index do |letter, letter_index|
        board[number_index][letter_index] = Square.new(letter + number.to_s)
      end
    end

    board
  end

  private

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