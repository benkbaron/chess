class King < Piece

  def initialize(board, side)
    super
    @symbol = "K"
    if side == :white
      @current_pos = [0, 4]
    else
      @current_pos = [7, 4]
    end
  end


  DELTAS = [
    [1,1],
    [1,0],
    [0,1],
    [1,-1],
    [-1,1],
    [-1,0],
    [-1,-1]
    [0,-1]
  ]


  def move_diffs
    
  end

end
