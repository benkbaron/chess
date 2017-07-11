require_relative 'sliding_piece'

class Bishop < Piece
  include SlidingPiece

  def initialize(board, pos, color)
    super
    @symbol = 'B'
    # if side == :white
    #   @current_pos = [0, 4]
    # else
    #   @current_pos = [7, 4]
    # end
  end


  DELTAS = [
    [1,1],
    [-1,1],
    [1,-1],
    [-1,-1]
  ]

  #
  # def move_diffs
  #   possible_moves = moves
  # end

  def valid_move?(end_pos)
    moves(DELTAS).include?(end_pos)
  end

end
