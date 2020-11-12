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

  attr_accessor :turns
  attr_reader :board
  def initialize(full = true)
    @board = self.generate_full_board(full)
    @turns = {:black => 0, :white => 0}
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

  def play
    color = ['white', 'black']
    counter = 0
    info()

    # Loop of the game. It breaks when there is a checkmate or stalemate

    loop do
      draw_board()
      
      # Loop of input. Ask input, then move the piece given in the input. It breaks if move method return a piece of the board.

      loop do
        break if !move(get_input(color[counter%2]), color[counter%2]).nil?
        puts 'That move is not possible. Please, try again.'
      end

      # get the king of the oposite color of the current turn. Also 

      king = find_by_name('K', color[(counter + 1)%2])
      pieces = get_pieces_by_color(color[counter%2])
      if king.checkmate?(pieces)
        display_win(color[counter%2])
        return
      elsif king.stalemate?(pieces)
        display_draw()
        return
      end

      counter += 1
    end

  end

  def get_input(color)
    
    loop do
    puts "[#{color.upcase}] My move is: "
    input = gets.chomp
    return if correct_input?(input)
    end
    
  end

  def display_win(color)
    puts '*' * 10
    puts "#{color.upcase} WON"
    puts '*' * 10
  end

  def display_draw
    puts '*' * 10
    puts "DRAW"
    puts '*' * 10
  end

  
  def info
    puts 'Info:'
    puts '1. Use Algebraic notation to move pieces. I.e: "Be5"  (move a bishop to e5)'
    puts '2. Use "O-O" or "O-O-O" to indicate castling '
    puts '2. Type "EXIT" to go back to menu.'
    puts
    puts 'Type to continue...'
    gets
  end

  # Input: the notations of the move
  # Color: the color of the piece you want to move
  
  def move(input, color)
    aux = input

    letter_upgrade = nil
    piece_to_move = nil
    arr_pieces = nil
    dest = nil
    
    if aux == 'O-O'
      rook  = color == 'black' ? board[0][7].piece : board[7][7].piece
      return unless short_castling?(rook)
      return move_castling(true, color)
    elsif aux == 'O-O-O'
      rook  = color == 'black' ? board[0][0].piece : board[7][0].piece
      return unless long_castling?(rook)
      return move_castling(false, color)
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
      aux.slice!(-1)
      first_letter = aux.slice!(0)
      arr_pieces = find_by_name(first_letter,color)
      dest = aux[-2..-1]
    elsif aux.match?(/^[BRQNK][a-h][a-h][1-8][+#]$/)
      aux.slice!(-1)
      first_letter = aux.slice!(0)
      arr_pieces = aux[0].match?(/[a-h]/) ? get_column(aux[0],color) : get_row(aux[0],color)
      dest = aux[-2..-1]
    elsif aux.match?(/^[BRQNK][1-8][a-h][1-8][+#]$/)
      aux.slice!(-1)
      first_letter = aux.slice!(0)
      arr_pieces = aux[0].match?(/[a-h]/) ? get_column(aux[0],color) : get_row(aux[0],color)
      dest = aux[-2..-1]
    elsif aux.match?(/^[BRQNK][a-h][1-8][a-h][1-8][+#]$/)
      aux.slice!(-1)
      first_letter = aux.slice!(0)
      piece_to_move = get_by_notation(aux[0..1], color)
      return unless letter_match_piece?(first_letter, piece_to_move.piece)
      dest = aux[-2..-1]
    elsif aux.match?(/^[BRQNK]x[a-h][1-8][+#]$/)
      aux.slice!(-1)
      first_letter = aux.slice!(0)
      aux = aux.split('x')
      aux.reject!(&:empty?)
      arr_pieces = find_by_name(first_letter, color)
      dest = aux[0]
    elsif aux.match?(/^[BRQNK][a-h]x[a-h][1-8][+#]$/)
      aux.slice!(-1)
      first_letter = aux.slice!(0)
      aux = aux.split('x')
      aux.reject!(&:empty?)
      arr_pieces = get_column(aux[0],color)
      dest = aux[1]
    elsif aux.match?(/^[BRQNK][1-8]x[a-h][1-8][+#]$/)
      aux.slice!(-1)
      first_letter = aux.slice!(0)
      aux = aux.split('x')
      aux.reject!(&:empty?)
      arr_pieces = get_row(aux[0],color)
      dest = aux[1]
    elsif aux.match?(/^[BRQNK][a-h][1-8]x[a-h][1-8][+#]$/)
      aux.slice!(-1)
      first_letter = aux.slice!(0)
      aux = aux.split('x')
      aux.reject!(&:empty?)
      piece_to_move = get_by_notation(aux[0], color)
      return unless letter_match_piece?(first_letter, piece_to_move.piece)
      dest = aux[1]
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
      
      first_letter = aux.slice!(0)
      aux = aux.split('x')
      aux.reject!(&:empty?)
      arr_pieces = get_column(first_letter,color)
      aux[0].delete!('e.p.')
      dest = aux[0]
      unless arr_pieces.nil?
        arr_pieces = delete_dif_by_name(arr_pieces, first_letter, color) unless first_letter.nil?

        arr_pieces.delete_if {|square| !square.piece.possible_movement?(get_indices(dest))}

        return if arr_pieces.size != 1
        piece_to_move = arr_pieces[0]
      end
      return move_en_passant(piece_to_move.NOTATION, dest)
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

    # Delete any piece that no match the letter given in the notation and the name of the piece (pawn if there is no letter). Also, it delete any piece that cannot move to the destination position.
    # Return nil if 

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

  def move_piece(src_notation, dest_notation)

    # Get indices of origin position and destination position
    src_indices = get_indices(src_notation)
    dest_indices = get_indices(dest_notation)


    return if will_leave_king_in_check?(src_indices, dest_indices)

    # swap origin piece for destiantion piece

    aux = board[dest_indices[0]][dest_indices[1]].piece
    board[dest_indices[0]][dest_indices[1]].piece = board[src_indices[0]][src_indices[1]].piece
    board[src_indices[0]][src_indices[1]].piece = nil
    board[dest_indices[0]][dest_indices[1]].piece.position = dest_indices
    turns[board[dest_indices[0]][dest_indices[1]].piece.COLOR.to_sym] += 1
    board[dest_indices[0]][dest_indices[1]].piece.number_of_move += 1 if board[dest_indices[0]][dest_indices[1]].piece.instance_of?(Rook) || board[dest_indices[0]][dest_indices[1]].piece.instance_of?(King)
    update_possible_movement_all_pieces()
    # If the movement is a take return the taken piece, else return the moved piece
    aux.nil? ? board[dest_indices[0]][dest_indices[1]].piece : aux
  end

  def move_en_passant(src_notation, dest_notation)
    src_indices = get_indices(src_notation)
    dest_indices = get_indices(dest_notation)
    aux = nil

    board[dest_indices[0]][dest_indices[1]].piece = board[src_indices[0]][src_indices[1]].piece
    board[src_indices[0]][src_indices[1]].piece = nil
    board[dest_indices[0]][dest_indices[1]].piece.position = dest_indices
    if board[dest_indices[0]][dest_indices[1]].piece.COLOR == 'white'
      aux = board[dest_indices[0] + 1][dest_indices[1]].piece
      board[dest_indices[0] + 1][dest_indices[1]].piece = nil
    else
      aux = board[dest_indices[0] + 1][dest_indices[1]].piece
      board[dest_indices[0] - 1][dest_indices[1]].piece = nil
    end
    
    turns[board[dest_indices[0]][dest_indices[1]].piece.COLOR.to_sym] += 1
    update_possible_movement_all_pieces()
    
    aux
  end

  # Castling movement. There are 4 types product of Queenside and Kingside and color of the piece. Return the rook

  def move_castling(short, color)

    if short
      if color == 'black'
        board[0][5].piece, board[0][6].piece = board[0][7].piece, board[0][4].piece
        board[0][7].piece, board[0][4].piece = nil, nil
        board[0][5].piece.position, board[0][6].piece.position = [0,5], [0,6]
        update_possible_movement_all_pieces()
        
        return board[0][5].piece
      else
        board[7][5].piece, board[7][6].piece = board[7][7].piece, board[7][4].piece
        board[7][7].piece, board[7][4].piece = nil, nil
        board[7][5].piece.position, board[7][6].piece.position = [7,5], [7,6]
        update_possible_movement_all_pieces()
        
        return board[7][5].piece
      end
    else
      if color == 'black'
        board[0][3].piece, board[0][2].piece = board[0][0].piece, board[0][4].piece
        board[0][7].piece, board[0][4].piece = nil, nil
        
        board[0][3].piece.position, board[0][2].piece.position = [0,3], [0,2]
        update_possible_movement_all_pieces()

        return board[0][3].piece
      else
        board[7][3].piece, board[7][2].piece = board[7][0].piece, board[7][4].piece
        board[7][7].piece, board[7][4].piece = nil, nil
        board[7][3].piece.position, board[7][2].piece.position = [7,3], [7,2]
        update_possible_movement_all_pieces()
        
        return board[7][3].piece
      end
    end

  end

  def will_leave_king_in_check?(src_indices, dest_indices)
    # Make the move and update the possible movement of all pieces.
    
    aux_dest = board[dest_indices[0]][dest_indices[1]].piece
    board[dest_indices[0]][dest_indices[1]].piece = board[src_indices[0]][src_indices[1]].piece
    board[src_indices[0]][src_indices[1]].piece = nil
    board[dest_indices[0]][dest_indices[1]].piece.position = dest_indices
    update_possible_movement_all_pieces()

    # Get the king of the piece that has been moved.
    king_same_color_src = find_by_name('K', board[dest_indices[0]][dest_indices[1]].piece.COLOR)
    color = board[dest_indices[0]][dest_indices[1]].piece.COLOR == 'white' ? 'black' : 'white'
    pieces_op_color = get_pieces_by_color(color)
    
    # See if king is in check
    result = king_same_color_src[0].piece.check?(pieces_op_color)

    board[src_indices[0]][src_indices[1]].piece = board[dest_indices[0]][dest_indices[1]].piece
    board[src_indices[0]][src_indices[1]].piece.position = src_indices
    board[dest_indices[0]][dest_indices[1]].piece = aux_dest
    update_possible_movement_all_pieces()
    
    result
  end

  def short_castling?(rook)
    return false unless rook.instance_of?(Rook)

    king = rook.COLOR == 'black' ? board[0][4].piece : board[7][4].piece
    return false  unless king.instance_of?(King)

    og_pos = king.position
    color = rook.COLOR == 'black' ? 'white' : 'black'
    pieces = get_pieces_by_color(color)
    result = nil

    # Return false if kign and rook have move, the square between them aren't empty and king is in check

    return false if !king.number_of_move.zero? || !rook.number_of_move.zero? || king.check?(pieces) || !board[king.position[0]][king.position[1] + 1].piece.nil? || !board[king.position[0]][king.position[1] + 2].piece.nil?

    # This loop check that any piece can move to the square between rook and king. Move king temporaly.

    1.upto(2) do |num|

      board[og_pos[0]][og_pos[1] + num].piece = king
      board[og_pos[0]][og_pos[1] + num].piece.position = [og_pos[0], og_pos[1] + num]
      update_possible_movement_all_pieces()

      result = board[king.position[0]][king.position[1]].piece.check?(pieces)
      board[king.position[0]][king.position[1]].piece = nil
      
      break if result
    end

    # Restore king to his original position

    board[og_pos[0]][og_pos[1]].piece.position = og_pos
    update_possible_movement_all_pieces()

    !result
  end

  # Check if Queenside castling is possible

  def long_castling?(rook)
    return false unless rook.instance_of?(Rook)

    king = rook.COLOR == 'black' ? board[0][4].piece : board[7][4].piece
    return false  unless king.instance_of?(King)

    og_pos = king.position
    color = rook.COLOR == 'black' ? 'white' : 'black'
    pieces = get_pieces_by_color(color)
    result = nil

    # Return false if kign and rook have move, the square between them aren't empty and king is in check

    return false if !king.number_of_move.zero? || !rook.number_of_move.zero? || king.check?(pieces) || !board[king.position[0]][king.position[1] - 1].piece.nil? || !board[king.position[0]][king.position[1] - 2].piece.nil?

    # This loop check that any piece can move to the square between rook and king. Move king temporaly.

    1.upto(2) do |num|

      board[og_pos[0]][og_pos[1] - num].piece = king
      board[og_pos[0]][og_pos[1] - num].piece.position = [og_pos[0], og_pos[1] - num]
      update_possible_movement_all_pieces()

      result = board[king.position[0]][king.position[1]].piece.check?(pieces)
      board[king.position[0]][king.position[1]].piece = nil
      
      break if result
    end

    # Restore king to his original position

    board[og_pos[0]][og_pos[1]].piece.position = og_pos
    update_possible_movement_all_pieces()

    !result
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
        next if square.piece.nil?
        square.piece.instance_of?(Pawn) ? square.piece.generate_possible_movement(board, turns) : square.piece.generate_possible_movement(board)

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
