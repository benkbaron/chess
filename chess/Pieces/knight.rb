require_relative 'stepping_piece'

class Knight < Piece
  include SteppingPiece

  def initialize(board, pos, color)
    super
    @symbol = 'N'
  end

  DELTAS = [
    [1,2],
    [2,1],
    [1,-2],
    [-2,1],
    [-2,-1],
    [2,-1],
    [-1,2],
    [-1,-2]
  ]

  def valid_move?(end_pos)
    moves(DELTAS).include?(end_pos)
  end

end
