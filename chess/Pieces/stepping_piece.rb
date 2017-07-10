module SteppingPiece

  def moves(deltas)
    deltas.map do |delta|
      dx, dy = delta
      x, y = current_pos
      [dx + x, dy + y]
    end
  end



end
