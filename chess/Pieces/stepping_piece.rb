module SteppingPiece

  def moves(deltas)
    move_arr = deltas.map do |delta|
      dx, dy = delta
      x, y = current_pos
      [dx + x, dy + y]
    end
    filter_moves(move_arr)
  end

  def filter_moves(move_arr)
    move_arr.reject { |pos| board[pos].color == self.color }
  end

end
