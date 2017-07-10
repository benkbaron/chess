require_relative 'sliding_piece'

class Rook < Piece
  include SlidingPiece

  def initialize(board, pos)
    super
    @symbol = 'R'
    # if side == :white
    #   @current_pos = [0, 4]
    # else
    #   @current_pos = [7, 4]
    # end
  end


  DELTAS = [
    [0,1],
    [1,0],
    [0,-1],
    [-1,0]
  ]

  #
  # def move_diffs
  #   possible_moves = moves
  # end

  def valid_move?(end_pos)
    moves(DELTAS).include?(end_pos)
  end

end
