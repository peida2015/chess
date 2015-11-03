# require_relative 'manifest.rb'

class Piece

  attr_reader :type, :color
  attr_accessor :pos

  def initialize(type, pos, color)
    @type, @pos, @color = type, pos, color
  end

  def in_bounds?(pos)
    pos[0].between?(0,7) && pos[1].between?(0,7)
  end

end
