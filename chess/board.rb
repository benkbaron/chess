require 'byebug'
require_relative 'Pieces/piece'
require_relative 'Pieces/nullpiece'
require_relative 'display'

class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8) {Array.new(8)}
    set_board
  end

  def set_board
    @grid.each_with_index do |row, idx1|
      row.each_with_index do |square, idx2|
        pos = [idx1, idx2]
        case idx1
        when 0, 1, 6, 7
          self[pos] = Piece.new(self, 'P', pos)
        else
          self[pos] = NullPiece.new(self, pos)
        end
      end
    end
  end

  def move_piece(start_pos, end_pos)
    begin
      raise "Piece nonexistant" if self[start_pos].class == NullPiece
      raise "Invalid end position" if out_of_bounds?(end_pos)
    rescue
      # Ask again
    end

    self[end_pos], self[start_pos] = self[start_pos], self[end_pos]
    self[end_pos].new_position(end_pos)
    self[start_pos].new_position(start_pos)
  end

  def out_of_bounds?(pos)
    row, col = pos
    return false if row < 0 || row > 7
    return false if col < 0 || col > 7
    true
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, piece)
    x, y = pos
    @grid[x][y] = piece
  end




end



if __FILE__ == $PROGRAM_NAME
  board = Board.new
  bd = Display.new(board)
  loop do
    start_pos = bd.render
    end_pos = bd.render
    board.move_piece(start_pos, end_pos)
  end
end
