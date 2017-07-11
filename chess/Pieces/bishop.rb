require_relative 'sliding_piece'

class Bishop < Piece
  include SlidingPiece

  def initialize(board, pos, color)
    super
    @symbol = 'B'
  end
  
  DELTAS = [
    [1,1],
    [-1,1],
    [1,-1],
    [-1,-1]
  ]

  def valid_move?(end_pos)
    moves(DELTAS).include?(end_pos)
  end

end
