class Pawn < Piece

  attr_reader :starting_row

  def initialize(*args)
    super(*args)
    @starting_row = args[0][0]
    @type = :pawn
  end

  def moves

  end

  def moves_down
    moves = []
    if @pos[0] == 1
      moves << [pos[0]+2,pos[1]]
      moves << [pos[0]+1,pos[1]]
    else
      moves << [pos[0]+1,pos[1]]
    end
    moves
  end

  def pieces_in_front
    pieces = []
    [[1,-1],[1,0],[1,1],[2,0]].map do |diff|
      pieces << @board[[pos[0]+diff[0],pos[1]+diff[1]]].pos
    end.delete_if(&:nil?)
    pieces
  end
end
