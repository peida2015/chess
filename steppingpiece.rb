
class SteppingPiece < Piece
  KING_MOVES_DIFF = [[-1,-1],[-1,1],[1,-1],[1,1],
                    [0,-1],[0,1],[-1,0],[1,0]]

  KNIGHT_MOVES_DIFF = [[-2,-1],[-2,1],[2,-1],[2,1],
                      [-1,-2],[-1,2],[1,-2],[1,2]]

  def moves
    if move_dirs == :knight
      knight_moves
    elsif move_dirs == :hop
      king_moves
    end
  end

  def king_moves
    KING_MOVES_DIFF.map do |diff|
      possible_move = [pos[0] + diff[0], pos[1] + diff[1]]
    end.select {|move| in_bounds?(move)}
      #possible_move if in_bounds?(possible_move)
  end

  def knight_moves
    KNIGHT_MOVES_DIFF.map {|diff| [pos[0] + diff[0], pos[1] + diff[1]]}
  end

end

class Knight < SteppingPiece
  def move_dirs
    :knight
  end
end

class King < SteppingPiece
  def move_dirs
    :hop
  end
end
