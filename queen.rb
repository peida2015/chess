class Queen < SlidingPiece

  def initialize(*args)
    super(*args)
    @type = :queen
  end

  def move_dirs
    :all
  end
end
