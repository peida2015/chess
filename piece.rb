
class Piece

  attr_reader :type, :color
  attr_accessor :pos

  def initialize(type, pos, color)
    @type, @pos, @color = type, pos, color
  end

end

class SlidingPiece < Piece

  DIAG_MOVES_DIFF =(1..7).map {|i| [[i, i], [-i, -i], [i, -i], [-i, i]]}.reduce(:+)

  def moves
    # move_list = []
    if move_dirs == :straight
      straight_moves
    elsif move_dirs == :diag
      diag_moves
    elsif move_dirs == :all
      diag_moves + straight_moves
    end

    # move_list.sort
  end

  def straight_moves
    move_list =[]
    (0..7).to_a.each do |i|
      move_list << [i, pos[1]] unless i == pos[0]
      move_list << [pos[0], i] unless i == pos[1]
    end
    move_list
  end

  def diag_moves
    move_list = []
    DIAG_MOVES_DIFF.each do |diff|
      new_move = [diff[0]+pos[0], diff[1]+pos[1]]
      move_list << new_move if new_move.all? {|x| x.between?(0,7)}
    end
    move_list
  end
end



class Bishop < SlidingPiece

  def move_dirs
    :diag
  end
end

class Rook < SlidingPiece

  def move_dirs
    :straight
  end
end

class Queen < SlidingPiece

  def move_dirs
    :all
  end
end
