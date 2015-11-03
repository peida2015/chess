# require_relative 'manifest.rb'

class Piece

  attr_reader :type, :color, :board
  attr_accessor :pos

  def initialize(pos, color, board)
    @pos, @color,@board = pos, color, board
  end

  def in_bounds?(pos)
    pos[0].between?(0,7) && pos[1].between?(0,7)
  end

  
end
