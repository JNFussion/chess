class Square
  attr_accessor :NOTATION, :piece

  def initialize(notation, piece = nil)
    @NOTATION = notation
    @piece = piece
  end

end