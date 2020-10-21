class Square
  attr_accessor :position, :piece

  def initialize(notation, piece = nil)
    @notation = notation
    @piece = piece
  end

end