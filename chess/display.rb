require 'colorize'
require_relative 'cursor'

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
            print square.value.colorize(:background => :light_blue)
          else
            print square.value
          end
        end
        puts "\n"
      end
      cursor.get_input
      system "clear"
    end
  end


end
