require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display
  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  attr_reader :cursor, :board

  def render
    while true
      board.grid.each do |row|
        row.each do |square|
          if square.current_pos == cursor.cursor_pos
            if square.value.nil?
              print " ".colorize(:background => :cyan)
            else
              print square.value.colorize(:background => :cyan)
            end
          else
            if square.value.nil?
              print " "
            else
              print square.value
            end
          end
        end
        puts "\n"
      end
      cursor.get_input
      system "clear"
    end
  end


end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  b_display = Display.new(b)

  b_display.render
end
