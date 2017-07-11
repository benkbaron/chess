require_relative 'stepping_piece'

class King < Piece
  include SteppingPiece

  def initialize(board, pos, color)
    super
    @symbol = 'K'
  end

  DELTAS = [
    [1,1],
    [1,0],
    [0,1],
    [1,-1],
    [-1,1],
    [-1,0],
    [-1,-1],
    [0,-1]
  ]

  def valid_move?(end_pos)
    moves(DELTAS).include?(end_pos)
  end

end
