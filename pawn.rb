class Pawn < Piece

  attr_reader :starting_row

  def initialize(*args)
    super(*args)
    @starting_row = args[0][0]
    @type = :pawn
  end

  def moves
    return moves_down if self.color == :black
    return moves_up if self.color == :white
  end

  def moves_down
    moves = []
    up = { spot_1: [pos[0]+1,pos[1]],
    spot_2: [pos[0]+2,pos[1]],
    spot_3: [pos[0]+1,pos[1]-1],
    spot_4: [pos[0]+1,pos[1]+1] }

    if @board[up[:spot_1]].nil?
      moves << up[:spot_1] if @board[up[:spot_1]].nil?
      moves << up[:spot_2] if @pos[0] == 1 && @board[up[:spot_2]].nil?
    end
    unless @board[up[:spot_4]].nil?
      moves << up[:spot_4] if @board[up[:spot_4]].color != self.color
    end
    unless @board[up[:spot_3]].nil?
      moves << up[:spot_3] if @board[up[:spot_3]].color != self.color
    end

    moves
  end

  def moves_up
    moves = []
    spot_1 = [pos[0]-1,pos[1]]
    spot_2 = [pos[0]-2,pos[1]]
    spot_3 = [pos[0]-1,pos[1]-1]
    spot_4 = [pos[0]-1,pos[1]+1]

    if @board[spot_1].nil?
      moves << spot_1 if @board[spot_1].nil?
      moves << spot_2 if @pos[0] == 6 && @board[spot_2].nil?
    end
    unless @board[spot_4].nil?
      moves << spot_4 if @board[spot_4].color != self.color
    end
    unless @board[spot_3].nil?
      moves << spot_3 if @board[spot_3].color != self.color
    end

    moves
  end

  # def pieces_in_front
  #   pieces = []
  #   [[1,-1],[1,0],[1,1],[2,0]].map do |diff|
  #     pieces << @board[[pos[0]+diff[0],pos[1]+diff[1]]]
  #   end
  #   pieces.delete_if(&:nil?)
  # end
end
