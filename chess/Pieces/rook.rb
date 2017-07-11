require_relative 'sliding_piece'

class Rook < Piece
  include SlidingPiece

  def initialize(board, pos, color)
    super
    @symbol = 'R'
  end


  DELTAS = [
    [0,1],
    [1,0],
    [0,-1],
    [-1,0]
  ]

  def valid_move?(end_pos)
    moves(DELTAS).include?(end_pos)
  end

end
