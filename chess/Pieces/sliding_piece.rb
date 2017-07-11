module SlidingPiece

  def moves(deltas)

    move_arr = []
    deltas.each do |delta|
      dx, dy = delta
      7.times do |_idx|
        x, y = current_pos
        new_pos = [dx + x, dy + y]
        break if board.out_of_bounds?(new_pos)
        case self.board[new_pos].color
        when :null then move_arr << new_pos
        when self.color then break
        else
          move_arr << new_pos
          break
        end
        dx += delta[0]
        dy += delta[1]
      end
    end
    move_arr
  end
  
end
