class Bishop < SlidingPiece

  def initialize(*args)
    @type = :bishop
    super(*args)
  end

  def move_dirs
    :diag
  end
end
