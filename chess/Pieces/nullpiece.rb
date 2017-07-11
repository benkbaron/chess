require_relative 'piece'
require 'singleton'

class NullPiece < Piece
  include Singleton

  def initialize
    @symbol = " "
    @color = :null
  end

  attr_reader :color


end
