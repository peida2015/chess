# require_relative 'manifest.rb'

class Piece

  attr_reader :type, :color, :board
  attr_accessor :pos

  def initialize(pos, color, board)
    @pos, @color,@board = pos, color, board
  end

  def in_bounds?(pos)
    pos[0].between?(0,7) && pos[1].between?(0,7)
  end

  def check_row
    left_moves = []
    right_moves = []
    (1..7).each do |i|
      spot = [pos[0],pos[1]-i]
      if in_bounds?(spot)
        if @board[spot].nil?
          left_moves << spot
        elsif @board[spot].color != self.color
          left_moves << spot
          break
        else
          break
        end
      end
    end

    (1..7).each do |i|
      spot = [pos[0],pos[1]+i]
      if in_bounds?(spot)
        if @board[spot].nil?
          right_moves << spot
        elsif @board[spot].color != self.color
          right_moves << spot
          break
        else
          break
        end
      end
    end
    left_moves + right_moves
  end

  def check_col
    up_moves = []
    down_moves = []
    (1..7).each do |i|
      spot = [pos[0]+i,pos[1]]
      if in_bounds?(spot)
        if @board[spot].nil?
          down_moves << spot
        elsif @board[spot].color != self.color
          down_moves << spot
          break
        else
          break
        end
      end
    end

    (1..7).each do |i|
      spot = [pos[0]-i,pos[1]]
      if in_bounds?(spot)
        if @board[spot].nil?
          up_moves << spot
        elsif @board[spot].color != self.color
          up_moves << spot
          break
        else
          break
        end
      end
    end

    up_moves + down_moves
  end

  def check_diag
    up_right = []
    up_left = []
    down_right = []
    down_left = []

    (1..7).each do |i|
      spot = [pos[0]-i,pos[1]+i]
      if in_bounds?(spot)
        if @board[spot].nil?
          up_right << spot
        elsif @board[spot].color != self.color
          up_right << spot
          break
        else
          break
        end
      end
    end

    (1..7).each do |i|
      spot = [pos[0]-i,pos[1]-i]
      if in_bounds?(spot)
        if @board[spot].nil?
          up_left << spot
        elsif @board[spot].color != self.color
          up_left << spot
          break
        else
          break
        end
      end
    end

    (1..7).each do |i|
      spot = [pos[0]+i,pos[1]+i]
      if in_bounds?(spot)
        if @board[spot].nil?
          down_right << spot
        elsif @board[spot].color != self.color
          down_right << spot
          break
        else
          break
        end
      end
    end

    (1..7).each do |i|
      spot = [pos[0]+i,pos[1]-i]
      if in_bounds?(spot)
        if @board[spot].nil?
          down_left << spot
        elsif @board[spot].color != self.color
          down_left << spot
          break
        else
          break
        end
      end
    end

    up_left + up_right + down_left + down_right
  end
end
