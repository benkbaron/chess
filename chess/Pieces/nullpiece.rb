require_relative 'piece'

class NullPiece < Piece

  def initialize(board, current_pos = nil)
    super(board, current_pos)
  end


end
