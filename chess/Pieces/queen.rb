require_relative 'sliding_piece'

class Queen < Piece
  include SlidingPiece

  def initialize(board, pos, color)
    super
    @symbol = 'Q'
  end

  DELTAS = [[1,1],[1,0],[0,1],[1,-1],[-1,1],[-1,0],[-1,-1],[0,-1]]

  def valid_move?(end_pos)
    moves(DELTAS).include?(end_pos)
  end

end
