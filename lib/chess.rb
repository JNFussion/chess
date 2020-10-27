require_relative 'square'
require_relative 'pawn'
require_relative 'rook'
require_relative 'knight'
require_relative 'bishop'
require_relative 'king'
require_relative 'queen'
require_relative 'movement'
require_relative 'factory'


class Chess
  include Factory
  attr_reader :board
  def initialize(full = true)
    @board = self.generate_full_board(full)
  end

  def menu
    puts "MENU"
    puts "1. Play game."
    puts "2. Save game."
    puts "3. Load game."

  end

  def move_piece(src, dest)
    return unless get_piece_by_notation(src).possible_movement?(get_indeces(dest))
    src_indeces = get_indeces(src)
    dest_indeces = get_indeces(dest)

    # if there is a piece in the destination square is set to nil.

    board[dest_indeces[0]][dest_indeces[1]].piece = nil unless board[dest_indeces[0]][dest_indeces[1]].piece.nil?

    # Swap source piece and destination piece. Then update the position of source piece and the possible movement.

    board[src_indeces[0]][src_indeces[1]].piece, board[dest_indeces[0]][dest_indeces[1]].piece = board[dest_indeces[0]][dest_indeces[1]].piece, board[src_indeces[0]][src_indeces[1]].piece
    board[dest_indeces[0]][dest_indeces[1]].piece.position = dest_indeces
    board[dest_indeces[0]][dest_indeces[1]].piece.generate_possible_movement(board)

    board[dest_indeces[0]][dest_indeces[1]].piece
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

  def get_indeces(notation)
    board.each_with_index do |row, row_index|
      row.each_with_index do |square, column|
         return [row_index, column] if square.NOTATION == notation
      end
    end
  end

  def get_piece_by_notation(notation)
    board.each do |row|
      row.each do |square|
         return square.piece if square.NOTATION == notation
      end
    end
  end

end
