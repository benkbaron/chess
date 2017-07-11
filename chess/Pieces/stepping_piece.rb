module SteppingPiece

  def moves(deltas)
    move_arr = []
    deltas.each do |delta|
      dx, dy = delta
      x, y = current_pos
      new_pos = [dx + x, dy + y]
      move_arr << new_pos unless board.out_of_bounds?(new_pos)
    end
    filter_moves(move_arr)
  end

  def filter_moves(move_arr)
    move_arr.reject { |pos| board[pos].color == self.color }
  end

end
