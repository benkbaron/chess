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
    dy = current_pos[1] - end_pos[1]
    if first_move?
      distance = (@color == :white ? [-1, -2] : [1, 2])
    else
      distance = (@color == :white ? [-1] : [1])
    end
    case @color
    when :white
      return true if board[end_pos].color == :black && attacking_positions(:white).include?(end_pos)
      return false unless distance.include?(dx) #-1
    when :black
      attacking_positions = attacking_positions(:black)
      return true if board[end_pos].color == :white && attacking_positions(:black).include?(end_pos)
      return false unless distance.include?(dx) #1
    end
    return false if current_pos[1] != end_pos[1]
    true
  end

  def first_move?
    @color == :white ? current_pos[0] == 1 : current_pos[0] == 6
  end

  def attacking_positions(color)
    if color == :white
      [[current_pos[0] + 1, current_pos[1] + 1], [current_pos[0] + 1, current_pos[1] - 1]]
    else
      [[current_pos[0] - 1, current_pos[1] - 1], [current_pos[0] - 1, current_pos[1] + 1]]
    end
  end

end#class end
