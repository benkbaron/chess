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
      checker = 0
      board.grid.each_with_index do |row, idx1|
        checker += 1
        row.each_with_index do |square, idx2|
          if [idx1, idx2] == cursor.cursor_pos
            checker += 1
            print square.symbol.colorize(:background => :cyan)
          else
            if square.color == :white
              checker += 1
              if checker.odd?
                print square.symbol.colorize(:color => :red)
              else
                print square.symbol.colorize(:color => :red, :background => :yellow)
              end
            elsif square.color == :black
              checker += 1
              if checker.odd?
                print square.symbol.colorize(:color => :blue)
              else
                print square.symbol.colorize(:color => :blue, :background => :yellow)
              end
            else
              checker += 1
              if checker.odd?
                print square.symbol
              else
                print square.symbol.colorize(:background => :yellow)
              end
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
