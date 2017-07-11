class Piece

  attr_reader :current_pos, :symbol, :board, :color

  def initialize(board, pos, color)
    @board = board
    @current_pos = pos
    @color = color
  end

  def move_dirs

  end

  def new_position(pos)
    @current_pos = pos
  end

  def to_s
    @symbol
  end

end
