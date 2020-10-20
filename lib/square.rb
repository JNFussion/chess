class Square
  attr_accessor :position, :piece

  def initialize(position, piece = nil)
    @position = position
    @piece = piece
  end

end