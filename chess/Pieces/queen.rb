require_relative 'sliding_piece'

class Queen < Piece
  include SlidingPiece

  def initialize(board, pos, color)
    super
    @symbol = 'Q'
    # if side == :white
    #   @current_pos = [0, 4]
    # else
    #   @current_pos = [7, 4]
    # end
  end


  DELTAS = [[1,1],[1,0],[0,1],[1,-1],[-1,1],[-1,0],[-1,-1],[0,-1]]

  #
  # def move_diffs
  #   possible_moves = moves
  # end

  def valid_move?(end_pos)
    moves(DELTAS).include?(end_pos)
  end

end
