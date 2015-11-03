class Rook < SlidingPiece

  def initialize(*args)
    super(*args)
    @type = :rook
  end
  

  def move_dirs
    :straight
  end
end
