class Piece

  def initialize(value, current_pos = nil)
    @value = value
    @current_pos = current_pos
  end

  def new_position(pos)
    @current_pos = pos
  end


end