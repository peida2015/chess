# require_relative 'manifest.rb'

class Piece

  attr_reader :type, :color
  attr_accessor :pos

  def initialize(type, pos, color)
    @type, @pos, @color = type, pos, color
  end

end
