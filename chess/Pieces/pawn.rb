class Pawn < Piece

  def initialize(board, pos, color)
    super
    @symbol = 'P'
  end

  DELTAS = [
    [1, 0],
    [-1, 0]
  ]

  def valid_move?(end_pos)
    dx = current_pos[0] - end_pos[0]
    return false if current_pos[1] != end_pos[1]
    if first_move?
      distance = (@color == :white ? [-1, -2] : [1, 2])
    else
      distance = (@color == :white ? [-1] : [1])
    end
    case @color
    when :white then return false unless distance.include?(dx) #-1
    when :black then return false unless distance.include?(dx) #1
    end
    true
  end

  def first_move?
    @color == :white ? current_pos[0] == 1 : current_pos[0] == 6
  end

end
