
class Piece

  attr_reader :type
  attr_accessor :pos

  def initialize(type, pos)
    @type = type
    @pos = pos
  end

end
