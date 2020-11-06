require_relative 'square'
require_relative 'pawn'
require_relative 'rook'
require_relative 'knight'
require_relative 'bishop'
require_relative 'king'
require_relative 'queen'
require_relative 'factory'



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
    option = nil
    loop do
      menu()
      puts 'Introduce option: '
      option = gets.chomp
      break if select(option).nil?
      puts 'Incorrect input, try again...'
    end
  end

  def menu
    puts "MENU:"
    puts "1. Play game."
    puts "2. Save game."
    puts "3. Load game."

  end

  # def play

  #   info()

  #   loop do
  #     arr_input = []
  #     draw_board()
  #     loop do
  #       puts '[WHITE] My move is: '
  #       input = gets.chomp
  #       input.upcase!
  #       arr_input = input.split(' ')
  #       break if correct_input?(arr_input) && move_piece?(arr_input[0], arr_input[1])

  #       puts 'Incorrect move, try again..'
  #     end
  #     move_piece(arr_input[0], arr_input[1])
  #     draw_board()

  #     if get_king('black').checkmate?(get_pieces_by_color('white'))
  #       puts '*' * 10
  #       puts 'WHITE WON!'
  #       puts '*' * 10
  #       return
  #     elsif get_king('black').stalemate?(get_pieces_by_color('white'))
  #       puts '*' * 10
  #       puts 'DRAW'
  #       puts '*' * 10
  #       return
  #     elsif get_king('black').check?(get_pieces_by_color('white'))
  #       @notation_king = get_notation(get_king('black'))
  #     end

  #     loop do
  #       puts '[BLACK] My move is: '
  #       input = gets.chomp
  #       input.upcase!
  #       arr_input = input.split(' ')
  #       break if correct_input?(arr_input) && move_piece?(arr_input[0], arr_input[1])

  #       puts 'Incorrect move, try again..'
  #     end
      
  #     move_piece(arr_input[0], arr_input[1])

  #     if get_king('white').checkmate?(get_pieces_by_color('black'))
  #       puts '*' * 10
  #       puts 'BLACK WON!'
  #       puts '*' * 10
  #       return
  #     elsif get_king('white').stalemate?(get_pieces_by_color('black'))
  #       puts '*' * 10
  #       puts 'DRAW'
  #       puts '*' * 10
  #       return
  #     elsif get_king('white').check?(get_pieces_by_color('black'))
  #       @notation_king = get_notation(get_king('white'))
  #     end
  #   end
  # end
  
  def info
    puts 'Info:'
    puts '1. Use Algebraic notation to move pieces. I.e: "Be5"  (move a bishop to e5)'
    puts '2. Use "O-O" or "O-O-O" to indicate castling '
    puts '2. Type "DRAW" to propose a draw.'
    puts '2. Type "EXIT" to go back to menu.'
    puts
    puts 'Type to continue...'
    gets
  end

  def move(input, color)
    aux = input

    letter_upgrade = nil
    piece_to_move = nil
    arr_pieces = nil
    dest = nil
    
    if aux == 'O-O'
      
    elsif aux == 'O-O-O'
    
    elsif aux.match?(/^[BRQNK][a-h][1-8]$/)
      first_letter = aux.slice!(0)
      arr_pieces = find_by_name(first_letter,color)
      dest = aux[-2..-1]
    elsif aux.match?(/^[BRQNK][a-h][a-h][1-8]$/)
      first_letter = aux.slice!(0)
      arr_pieces = aux[0].match?(/[a-h]/) ? get_column(aux[0],color) : get_row(aux[0],color)
      dest = aux[-2..-1]
    elsif aux.match?(/^[BRQNK][1-8][a-h][1-8]$/)
      first_letter = aux.slice!(0)
      arr_pieces = aux[0].match?(/[a-h]/) ? get_column(aux[0],color) : get_row(aux[0],color)
      dest = aux[-2..-1]
    elsif aux.match?(/^[BRQNK][a-h][1-8][a-h][1-8]$/)
      first_letter = aux.slice!(0)
      piece_to_move = get_by_notation(aux[0..1], color)
      return unless letter_match_piece?(first_letter, piece_to_move.piece)
      dest = aux[-2..-1]
    elsif aux.match?(/^[BRQNK][a-h][1-8][+#]$/)

    elsif aux.match?(/^[BRQNK][a-h][a-h][1-8][+#]$/)

    elsif aux.match?(/^[BRQNK][1-8][a-h][1-8][+#]$/)

    elsif aux.match?(/^[BRQNK][a-h][1-8][a-h][1-8][+#]$/)

    elsif aux.match?(/^[BRQNK]x[a-h][1-8][+#]$/)

    elsif aux.match?(/^[BRQNK][a-h]x[a-h][1-8][+#]$/)

    elsif aux.match?(/^[BRQNK][1-8]x[a-h][1-8][+#]$/)

    elsif aux.match?(/^[BRQNK][a-h][1-8]x[a-h][1-8][+#]$/)

    elsif aux.match?(/^[BRQNK]x[a-h][1-8]$/)
      first_letter = aux.slice!(0)
      aux = aux.split('x')
      aux.reject!(&:empty?)
      arr_pieces = find_by_name(first_letter, color)
      dest = aux[0]
    elsif aux.match?(/^[BRQNK][a-h]x[a-h][1-8]$/)
      first_letter = aux.slice!(0)
      aux = aux.split('x')
      aux.reject!(&:empty?)
      arr_pieces = get_column(aux[0],color)
      dest = aux[1]
    elsif aux.match?(/^[BRQNK][1-8]x[a-h][1-8]$/)
      first_letter = aux.slice!(0)
      aux = aux.split('x')
      aux.reject!(&:empty?)
      arr_pieces = get_row(aux[0],color)
      dest = aux[1]
    elsif aux.match?(/^[BRQNK][a-h][1-8]x[a-h][1-8]$/)
      first_letter = aux.slice!(0)
      aux = aux.split('x')
      aux.reject!(&:empty?)
      piece_to_move = get_by_notation(aux[0], color)
      return unless letter_match_piece?(first_letter, piece_to_move.piece)
      dest = aux[1]
    elsif aux.match?(/^[a-h][1-8]$/)
      arr_pieces = find_by_name(color)
      dest = aux[-2..-1]
    elsif aux.match?(/^[a-h][18][BRQN]$/)
      letter_upgrade = aux.slice!(-1)
      arr_pieces = find_by_name(color)
      dest = aux
    elsif aux.match?(/^[a-h][18]=[BRQN]$/)
      letter_upgrade = aux.slice!(-1)
      aux = aux.split('=')
      aux.reject!(&:empty?)
      arr_pieces = find_by_name(color)
      dest = aux[0]
    elsif aux.match?(/^[a-h]x[a-h][1-8]$/)
      first_letter = aux.slice!(0)
      aux = aux.split('x')
      aux.reject!(&:empty?)
      arr_pieces = get_column(first_letter,color)
      dest = aux[0]
    elsif aux.match?(/^[a-h]x[a-h][1-8]e.p.$/)

    elsif aux.match?(/^[a-h]x[a-h][18][QRNB]$/)
      first_letter = aux.slice!(0)
      letter_upgrade = aux.slice!(-1)
      aux = aux.split('x')
      aux.reject!(&:empty?)
      arr_pieces = get_column(first_letter,color)
      dest = aux[0]
    elsif aux.match?(/^[a-h]x[a-h][18]=[BRQN]$/)
      first_letter = aux.slice!(0)
      letter_upgrade = aux.slice!(-1)
      aux = aux.split(/x|=/)
      aux.reject!(&:empty?)
      arr_pieces = get_column(first_letter,color)
      dest = aux[0]
    end

    unless arr_pieces.nil?
    arr_pieces = delete_dif_by_name(arr_pieces, first_letter, color) unless first_letter.nil?
    arr_pieces.delete_if {|square| !square.piece.possible_movement?(get_indices(dest))}
    return if arr_pieces.size != 1
    piece_to_move = arr_pieces[0]
    end
    unless letter_upgrade.nil?
      move_piece(piece_to_move.NOTATION, dest)
      upgrade(dest, letter_upgrade)
    else
      move_piece(piece_to_move.NOTATION, dest)
    end
  end

  # def move(input, color)
  #   aux = input
  #   first_letter = aux.slice!(0) unless aux.length == 2

  #   letter_upgrade = nil
  #   piece_to_move = nil
  #   arr_pieces = nil
  #   dest = nil

    

  #   if aux.include?('x')
  #     aux = aux.split('x')
  #     aux.reject!(&:empty?)
  #     if aux.size == 1
  #       if first_letter.match?(/[RNBQK]/)
  #         arr_pieces = find_by_name(first_letter, color)
  #       else
  #         arr_pieces = get_column(first_letter,color)
  #       end
  #       dest = aux[0]
  #     elsif aux.size == 2
  #       if aux[0].match?(/[a-h][1-8]/)
  #         piece_to_move = get_by_notation(aux[0], color)
  #         return unless letter_match_piece?(first_letter, piece_to_move.piece)
  #       elsif aux[0].match?(/[a-h]/)
  #         arr_pieces = get_column(aux[0],color)
  #       elsif aux[0].match?(/[1-8]/)
  #         arr_pieces = get_row(aux[0],color)
  #       end
  #       dest = aux[1]
  #     end
  #   else
  #     if !first_letter.nil? && first_letter.match?(/[RNBQK]/)
  #       if aux.length == 2
  #         arr_pieces = find_by_name(first_letter,color)
  #       elsif aux.length == 3
  #         arr_pieces = aux[0].match?(/[a-h]/) ? get_column(aux[0],color) : get_row(aux[0],color)
  #       elsif aux.length == 4
  #         piece_to_move = get_by_notation(aux[0..1], color)
  #         return unless letter_match_piece?(first_letter, piece_to_move.piece)
  #       end
  #     else
  #       arr_pieces = find_by_name(color)
  #     end
  #     dest = aux[-2..-1]
  #   end

  #   unless arr_pieces.nil?
  #   arr_pieces = delete_dif_by_name(arr_pieces, first_letter, color) unless first_letter.nil?
  #   arr_pieces.delete_if {|square| !square.piece.possible_movement?(get_indices(dest))}
  #   return if arr_pieces.size != 1
  #   piece_to_move = arr_pieces[0]
  #   end
    
  #   move_piece(piece_to_move.NOTATION, dest)
  # end



  # def move_piece?(src, dest)
  #   get_piece_by_notation(src).possible_movement?(get_indices(dest))
  # end

  def move_piece(src_notation, dest_notation)

    # Get indices of origin position and destination position
    src_indices = get_indices(src_notation)
    dest_indices = get_indices(dest_notation)

    # swap origin piece for destiantion piece

    aux = board[dest_indices[0]][dest_indices[1]].piece
    board[dest_indices[0]][dest_indices[1]].piece = board[src_indices[0]][src_indices[1]].piece
    board[src_indices[0]][src_indices[1]].piece = aux
    board[dest_indices[0]][dest_indices[1]].piece.position = dest_indices
    update_possible_movement_all_pieces()
    # If the movement is a take return the taken piece, else return the moved piece
    aux.nil? ? board[dest_indices[0]][dest_indices[1]].piece : aux
  end

  def upgrade(notation, letter)
    indices = get_indices(notation)
    aux = board[indices[0]][indices[1]].piece
    if letter == 'R'
      board[indices[0]][indices[1]].piece = Rook.new(aux.COLOR, aux.INITIAL_POSITION)
    elsif letter == 'N'
      board[indices[0]][indices[1]].piece = Knight.new(aux.COLOR, aux.INITIAL_POSITION)
    elsif letter == 'B'
      board[indices[0]][indices[1]].piece = Bishop.new(aux.COLOR, aux.INITIAL_POSITION)
    elsif letter == 'Q'
      board[indices[0]][indices[1]].piece = Queen.new(aux.COLOR, aux.INITIAL_POSITION)
    end

    board[indices[0]][indices[1]].piece.position = indices
    board[indices[0]][indices[1]].piece.generate_possible_movement(board)

    board[indices[0]][indices[1]].piece
  end

  def update_possible_movement_all_pieces
    board.each do |row|
      row.each do |square|
        square.piece.generate_possible_movement(board) unless square.piece.nil?
      end
    end
  end

  def letter_match_piece?(letter, piece)
    
    if letter == 'R'
      return piece.instance_of?(Rook)
    elsif letter == 'N'
      return piece.instance_of?(Knight)
    elsif letter == 'B'
      return piece.instance_of?(Bishop)
    elsif letter == 'Q'
      return piece.instance_of?(Queen)
    elsif letter == 'K'
      return piece.instance_of?(King)
    else
      return piece.instance_of?(Pawn)
    end
  end

  def delete_dif_by_name(arr, letter= '', color)
    if letter == 'R'
      return delete_dif(arr, color, Rook.SYMBOLS[color.to_sym])
    elsif letter == 'N'
      return delete_dif(arr, color, Knight.SYMBOLS[color.to_sym])
    elsif letter == 'B'
      return delete_dif(arr, color, Bishop.SYMBOLS[color.to_sym])
    elsif letter == 'Q'
      return delete_dif(arr, color, Queen.SYMBOLS[color.to_sym])
    elsif letter == 'K'
      return delete_dif(arr, color, King.SYMBOLS[color.to_sym])
    else
      return delete_dif(arr, color, Pawn.SYMBOLS[color.to_sym])
    end
  end

  def delete_dif(arr, color, symbol)
    arr.delete_if { |square| square.piece.SYMBOL != symbol}
    arr
  end 

  def find_by_name(letter = '', color)
    
    if letter == 'R'
      return find(color, Rook.SYMBOLS[color.to_sym])
    elsif letter == 'N'
      return find(color, Knight.SYMBOLS[color.to_sym])
    elsif letter == 'B'
      return find(color, Bishop.SYMBOLS[color.to_sym])
    elsif letter == 'Q'
      return find(color, Queen.SYMBOLS[color.to_sym])
    elsif letter == 'K'
      return find(color, King.SYMBOLS[color.to_sym])
    else
      return find(color, Pawn.SYMBOLS[color.to_sym])
    end
  end

  def find(color, symbol)
    array = []
    board.each do |row|
      row.each do |square|
        next if square.piece.nil?
        array << square if square.piece.COLOR == color && square.piece.SYMBOL == symbol
      end
    end
    array
  end

  def get_column(letter, color)
    pieces = []
    col_index = ['a', 'b', 'c', 'd', 'e' , 'f', 'g', 'h'].index(letter)
    board.each do |row|
      next if row[col_index].piece.nil?
      pieces << row[col_index] if row[col_index].piece.COLOR == color
    end
    pieces
  end

  def get_row(number, color)
    row = Array.new(board[8-number.to_i])
    row.delete_if {|square| square.piece.nil? || square.piece.COLOR != color}
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

  def get_indices(notation)
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

  def get_by_notation(notation, color)
    board.each do |row|
      row.each do |square|
         return square if square.NOTATION == notation && (square.piece.nil? || square.piece.COLOR == color)
      end
    end
  end

  def correct_input?(input)
     
    if input.match?(/^[BRQNK][a-h][1-8]$|^[BRQNK][a-h][a-h][1-8]$|^[BRQNK][1-8][a-h][1-8]$|^[BRQNK][a-h][1-8][a-h][1-8]$|^[BRQNK][a-h][1-8][+#]$|^[BRQNK][a-h][a-h][1-8][+#]$|^[BRQNK][1-8][a-h][1-8][+#]$|^[BRQNK][a-h][1-8][a-h][1-8][+#]$|^[BRQNK]x[a-h][1-8][+#]$|^[BRQNK][a-h]x[a-h][1-8][+#]$|^[BRQNK][1-8]x[a-h][1-8][+#]$|^[BRQNK][a-h][1-8]x[a-h][1-8][+#]$|^[BRQNK]x[a-h][1-8]$|^[BRQNK][a-h]x[a-h][1-8]$|^[BRQNK][1-8]x[a-h][1-8]$|^[BRQNK][a-h][1-8]x[a-h][1-8]$|^[a-h][1-8]$|^[a-h][18][BRQN]$|^[a-h][18]=[BRQN]$|^[a-h]x[a-h][1-8]$|^[a-h]x[a-h][1-8]e.p.$|^[a-h]x[a-h][18][BRQN]$|^[a-h]x[a-h][18]=[BRQN]$/)
      return true
     elsif input == 'O-O' || input == 'O-O-O'
      return true
     end

     false
  end
  
  def select(option)
    return 1 unless correct_option?(option)


    if option.downcase == '1' || option.downcase == '1.' || option.downcase == 'play' || option.downcase == 'play game' || option.downcase == '1. play game'
      play()
    elsif option.downcase == '2' || option.downcase == '2.' || option.downcase == 'save' || option.downcase == 'save game' || option.downcase == '2. save game'
      save()
    elsif option.downcase == '3' || option.downcase == '3.' || option.downcase == 'load' || option.downcase == 'load game' || option.downcase == '3. load game'
      load()
    elsif option.downcase == 'exit'
      return 
    end
  end


  def correct_option?(option)

    if option.downcase == '1' || option.downcase == '1.' || option.downcase == 'play' || option.downcase == 'play game' || option.downcase == '1. play game'
      return true
    elsif option.downcase == '2' || option.downcase == '2.' || option.downcase == 'save' || option.downcase == 'save game' || option.downcase == '2. save game'
      return true
    elsif option.downcase == '3' || option.downcase == '3.' || option.downcase == 'load' || option.downcase == 'load game' || option.downcase == '3. load game'
      return true
    elsif option.downcase == 'exit'
      return true
    end

    false
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

end