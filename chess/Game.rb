require_relative 'board'
require 'byebug'

class Game

  def initialize
    @current_color = :white
    @board = Board.new
    @bdisplay = Display.new(@board)
  end

  def play
    until game_over?
      take_turn
      switch_color
    end
  end

  def take_turn
    puts "#{current_color}'s turn"
    start_pos = bdisplay.render
    raise ChessError.new("That's not your piece") if board[start_pos].color != current_color
    end_pos = bdisplay.render
    board.move_piece(start_pos, end_pos, current_color)
    rescue ChessError => e
      puts e.message
      retry
  end

  def switch_color
    @current_color = (current_color == :white ? :black : :white)
  end

  def game_over?
    false
  end

  private
  attr_reader :bdisplay, :board
  attr_accessor :current_color
end


if __FILE__ == $PROGRAM_NAME
  game_of_chess = Game.new
  game_of_chess.play
end
