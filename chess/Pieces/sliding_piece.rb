module SlidingPiece

  def moves(deltas)
    #  debugger
    move_arr = []
    deltas.each do |delta|
      dx, dy = delta
      7.times do |_idx|
        x, y = current_pos
        new_pos = [dx + x, dy + y]
        break if board.out_of_bounds?(new_pos)
        move_arr << new_pos
        if dx < 0
          dx -= 1
        elsif dx > 0
          dx += 1
        elsif dy < 0
          dy -= 1
        elsif dy > 0
          dy += 1
        end
      end
    end
    #  debugger
    move_arr
  end

end
