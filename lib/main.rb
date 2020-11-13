require_relative 'chess'

chess = Chess.new(true)

# lines = File.readlines 'full_games/white_win_2.pgn'
# lines.map! do |line, index|
#   line = line.split(' ')
#   line.shift
#   line
# end
# lines = lines.flatten

# chess.play(lines)

chess.game
