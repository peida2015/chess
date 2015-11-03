
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
    possible_moves = KING_MOVES_DIFF.map do |diff|
      [pos[0] + diff[0], pos[1] + diff[1]]
    end
    possible_moves.select do |move|
      in_bounds?(move) && (@board[move].nil? || @board[move].color != self.color)
    end
  end

  def knight_moves
    possible_moves = KNIGHT_MOVES_DIFF.map do |diff|
      [pos[0] + diff[0], pos[1] + diff[1]]
    end
    possible_moves.select do |move| 
      in_bounds?(move) && (@board[move].nil? || @board[move].color != self.color)
    end
  end

end

class Knight < SteppingPiece

  def initialize(*args)
    @type = :knight
    super(*args)
  end

  def move_dirs
    :knight
  end
end

class King < SteppingPiece

  def initialize(*args)
    @type = :king
    super(*args)
  end

  def move_dirs
    :hop
  end
end
