require_relative 'square'
require_relative 'pawn'
require_relative 'rook'
require_relative 'knight'
require_relative 'bishop'
require_relative 'king'
require_relative 'queen'
require_relative 'movement'
require_relative 'factory'
require 'pry'


class Chess
  include Factory
  attr_accessor :check_status
  attr_reader :board
  def initialize(full = true)
    @board = self.generate_full_board(full)
    @check_status = false
    @notation_king = ''
  end

  def game







  end

  def menu
    puts "MENU:"
    puts "1. Play game."
    puts "2. Save game."
    puts "3. Load game."

  end

  def play

    info()

    loop do
      arr_input = []
      draw_board()
      loop do
        puts '[WHITE] My move is: '
        input = gets.chomp
        input.upcase!
        arr_input = input.split(' ')
        break if correct_input?(arr_input) && move_piece?(arr_input[0], arr_input[1])

        puts 'Incorrect move, try again..'
      end
      move_piece(arr_input[0], arr_input[1])
      draw_board()

      if get_king('black').checkmate?(get_pieces_by_color('white'))
        puts '*' * 10
        puts 'WHITE WON!'
        puts '*' * 10
        return
      elsif get_king('black').stalemate?(get_pieces_by_color('white'))
        puts '*' * 10
        puts 'DRAW'
        puts '*' * 10
        return
      elsif get_king('black').check?(get_pieces_by_color('white'))
        @notation_king = get_notation(get_king('black'))
      end

      loop do
        puts '[BLACK] My move is: '
        input = gets.chomp
        input.upcase!
        arr_input = input.split(' ')
        break if correct_input?(arr_input) && move_piece?(arr_input[0], arr_input[1])

        puts 'Incorrect move, try again..'
      end
      
      move_piece(arr_input[0], arr_input[1])

      if get_king('white').checkmate?(get_pieces_by_color('black'))
        puts '*' * 10
        puts 'BLACK WON!'
        puts '*' * 10
        return
      elsif get_king('white').stalemate?(get_pieces_by_color('black'))
        puts '*' * 10
        puts 'DRAW'
        puts '*' * 10
        return
      elsif get_king('white').check?(get_pieces_by_color('black'))
        @notation_king = get_notation(get_king('white'))
      end
    end
  end
# DONT LET KING MOVE TO X POSITION IF THAT POSITION IS IN CHECK"
  def info
    puts 'Info:'
    puts '1. To move a piece use the following anotation: "Initial position of piece to move" "Target position", ei: "B8 C6"'
    puts '2. Type "DRAW" to propose a draw.'
    puts '2. Type "EXIT" to go back to menu.'
    puts
    puts 'Type to continue...'
    gets
  end

  def move_piece?(src, dest)
    get_piece_by_notation(src).possible_movement?(get_indeces(dest))
  end

  def move_piece(src, dest)
    return unless move_piece?(src, dest)

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

  def get_king(color)
    
    board.each do |row|
      row.each do |square|
        next if square.piece.nil?
        return square.piece if square.piece.COLOR == color && square.piece.instance_of?(King)
      end
    end

    nil
  end

  def get_pieces_by_color(color)
    pieces = []
    board.each do |row|
      row.each do |square|
        pieces << square.piece if !square.piece.nil? && square.piece.COLOR == color
      end
    end
    pieces
  end

  def get_indeces(notation)
    board.each_with_index do |row, row_index|
      row.each_with_index do |square, column|
         return [row_index, column] if square.NOTATION == notation
      end
    end
  end

  def get_notation(piece)
    board.each do |row|
      row.each do |square|
         return square.NOTATION if square.piece == piece
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

  def correct_input?(input)
    arr = input.split(' ')
    return false if arr.size != 2
    return false if arr[0].size != 2 || arr[1].size != 2
    return arr[0] == @notation_king && arr[1][0].match?(/[A-H]/) && arr[1][1].match?(/[1-8]/) if @check_status
    arr[0][0].match?(/[A-H]/) && arr[0][1].match?(/[1-8]/) && arr[1][0].match?(/[A-H]/) && arr[1][1].match?(/[1-8]/)
  end

end
  

