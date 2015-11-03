#require_relative 'manifest.rb'

class SlidingPiece < Piece

  DIAG_MOVES_DIFF = (1..7).map {|i| [[i, i], [-i, -i], [i, -i], [-i, i]]}.reduce(:+)

  def moves

    if move_dirs == :straight
      check_col + check_row
    elsif move_dirs == :diag
      check_diag
    elsif move_dirs == :all
      check_col + check_row + check_diag
    end

  end

  # def straight_moves
  #   move_list =[]
  #   (0..7).to_a.each do |i|
  #     move_list << [i, pos[1]] unless i == pos[0]
  #     move_list << [pos[0], i] unless i == pos[1]
  #   end
  #   move_list.sort
  # end
  #
  # def valid_moves
  #   straight_moves.select do |move|
  #   end
  # end
  #
  # def diag_moves
  #   move_list = []
  #   DIAG_MOVES_DIFF.each do |diff|
  #     new_move = [diff[0]+pos[0], diff[1]+pos[1]]
  #     move_list << new_move if new_move.all? {|x| x.between?(0,7)}
  #   end
  #   move_list.sort
  # end


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
