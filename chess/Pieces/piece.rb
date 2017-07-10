class Piece

  attr_reader :current_pos, :symbol

  def initialize(board, symbol, pos)
    @board = board
    @symbol = symbol
    @current_pos = pos
  end

  def move_dirs

  end

  def new_position(pos)
    @current_pos = pos
  end

  def to_s
    @symbol
  end

  def valid_moves()

  end

  private

  def move_into_check(to_pos)

  end


end
