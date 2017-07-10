require_relative 'piece'

class NullPiece < Piece

  def initialize(current_pos = nil)
    super(nil, current_pos)
  end


end
