require_relative 'board'
require 'byebug'
require_relative 'display'
require_relative 'Pieces/piece'
require_relative 'Pieces/nullpiece'
require_relative 'Pieces/king'
require_relative 'Pieces/queen'
require_relative 'Pieces/knight'
require_relative 'Pieces/rook'
require_relative 'Pieces/bishop'
require_relative 'Pieces/pawn'
require 'colorize'

module Check

  def find_king(color)
    grid.each_with_index do |row, idx1|
      row.each_with_index do |square, idx2|
        return [idx1, idx2] if square.class == King && square.color == color
      end
    end
    nil
  end

  def in_check?(color)
    king_location = find_king(color)
    opponent_color = color == :white ? :black : :white
    grid.each do |row|
      row.each do |square|
        if square.color == opponent_color
          if square.valid_move?(king_location)
            puts "You're in check!"
            return true
          end
        end
      end
    end
    false
  end



  # def self.dup_board(grid)
  #   new_board = []
  #   grid.each do |el|
  #     if el.is_a?(Array)
  #       new_board << Check.dup_board(el)
  #     else
  #       new_board << el
  #     end
  #   end
  #   new_board
  # end

end #module end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  board2 = Check.dup_board(board.grid)
  p board
  p board2
  board2[0][0] = "!!!!!!!!!!!!!!"
  p board
  p board2

end
