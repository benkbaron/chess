require_relative 'stepping_piece'

class Knight < Piece
  include SteppingPiece

  def initialize(board, pos, color)
    super
    @symbol = 'N'
    # if side == :white
    #   @current_pos = [0, 4]
    # else
    #   @current_pos = [7, 4]
    # end
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

  #
  # def move_diffs
  #   possible_moves = moves
  # end

  def valid_move?(end_pos)
    moves(DELTAS).include?(end_pos)
  end

end
