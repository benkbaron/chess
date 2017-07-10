require_relative 'piece'

class NullPiece < Piece

  def initialize(board, current_pos = nil)
    super(board, nil, current_pos)
  end


end
