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
require_relative 'check.rb'

class Board
  include Check

  attr_reader :grid
  def initialize
    @grid ||= Array.new(8) {Array.new(8)}
    set_board
  end

  def set_board
    @grid.each_with_index do |row, idx|
      case idx
      when 0
        @grid[idx] = setup_back_row(:white, idx)
      when 1
        @grid[idx] = setup_pawn_row(:white, idx)
      when 6
        @grid[idx] = setup_pawn_row(:black, idx)
      when 7
        @grid[idx] = setup_back_row(:black, idx)
      else
        @grid[idx] = setup_null_row
      end
    end
  end



  def move_piece(start_pos, end_pos)
    raise ChessError.new("Piece nonexistant") if self[start_pos].class == NullPiece
    raise ChessError.new("Invalid end position") unless self[start_pos].valid_move?(end_pos)
    #if you are in check:
    # raise CheckError unless new_move => not in check
    self[end_pos], self[start_pos] = self[start_pos], self[end_pos]
    self[end_pos].new_position(end_pos)
    self[start_pos].new_position(start_pos)
    self[start_pos] = NullPiece.instance if taking_piece?(start_pos)
  end

  def self.dup_board(current_board)
    new_board = Board.new
    current_board.grid.each_with_index do |row, idx1|
      row.each_with_index do |square, idx2|
        if square.class == NullPiece
          new_board[[idx1, idx2]] = NullPiece.instance
        else
          new_board[[idx1, idx2]] = square.dup
        end
      end
    end
    new_board
  end

  def taking_piece?(pos)
    self[pos].class != NullPiece
  end

  def out_of_bounds?(pos)
    row, col = pos
    return true if row < 0 || row > 7
    return true if col < 0 || col > 7
    false
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, piece)
    x, y = pos
    @grid[x][y] = piece
  end

  private

  def setup_pawn_row(color, row_idx)
    (0..7).map { |col_idx| Pawn.new(self, [row_idx, col_idx], color) }
  end

  def setup_back_row(color, row_idx)
    (0..7).map do |col_idx|
      args = [self, [row_idx, col_idx], color]
      case col_idx
      when 0, 7 then Rook.new(*args)
      when 1, 6 then Knight.new(*args)
      when 2, 5 then Bishop.new(*args)
      when 3 then King.new(*args)
      when 4 then Queen.new(*args)
      end
    end
  end

  def setup_null_row
    (0..7).map { |col_idx| NullPiece.instance }
  end



end

class ChessError < StandardError
end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  bd = Display.new(board)
  system "clear"
  loop do
    begin
      board.in_check?(:white)
      start_pos = bd.render
      end_pos = bd.render
      board.move_piece(start_pos, end_pos)
    rescue ChessError => e
      puts e.message
    retry
  end
  end
end
