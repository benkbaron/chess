require 'colorize'
require_relative 'cursor'
require_relative 'board'
require 'byebug'

class Display
  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  attr_reader :cursor, :board

  def render
    x = nil
    loop do
      board.grid.each_with_index do |row, idx1|
        row.each_with_index do |square, idx2|
          if [idx1, idx2] == cursor.cursor_pos
            print square.symbol.colorize(:background => :cyan)
          else
            if square.color == :white
              print square.symbol.colorize(:color => :red)
            elsif square.color == :black
              print square.symbol.colorize(:color => :blue)
            else
              print square.symbol
            end
          end
        end
        puts "\n"
      end

      x = cursor.get_input

      system "clear"
      p "!!!!!!#{x}!!!!!!!"
      break if x != nil

    end
    x
  end


end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  b_display = Display.new(b)

  b_display.render
end
