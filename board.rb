
require_relative 'piece.rb'

class Board

  attr_accessor :grid

  def initialize(grid = Array.new(8) {Array.new(8)} )
    @grid = grid
    populate_other_pieces
    populate_pawns
  end

  def [](pos)
    @grid[pos[0]][pos[-1]]
  end

  def []=(pos, value)
    @grid[pos[0]][pos[-1]] = value
  end

  # def inspect(pos)
  #   @grid[pos[0],pos[1]].type
  # end

  def populate_pawns
    pawn_lines = [1,6]

    pawn_lines.each do |line|
      @grid[line].each_index do |i|
        if line.odd?
          self[[line, i]] = Pawn.new([line, i],:black, self)
        else
          self[[line, i]] = Pawn.new([line, i],:white, self)
        end
      end
    end
  end

  def populate_other_pieces
    order = [:rook, :knight, :bishop, :king, :queen, :bishop, :knight, :rook]
    piece_types = {:rook => Proc.new {|pos,color,board| Rook.new(pos, color, board)},
      :knight => Proc.new {|pos,color,board| Knight.new(pos, color, board)},
      :bishop => Proc.new {|pos,color,board| Bishop.new(pos, color, board)},
      :king => Proc.new {|pos,color,board| King.new(pos, color, board)},
      :queen => Proc.new {|pos,color,board| Queen.new(pos, color, board)}}
    @grid[0].each_index do |i|
      self[[0, i]] = piece_types[order[i]].call([0, i], :black, self)
    end
    @grid[7].each_index do |i|
      self[[7, i]] = piece_types[order[i]].call([7, i], :white, self)
    end
  end

  def move(start, end_pos)
    raise "Invalid move" unless valid_move?(start, end_pos)
    self[end_pos]= self[start]
    self[end_pos].pos = end_pos
    self[start] = nil
  end

  def valid_move?(start, end_pos)
    !self[start].nil? && self[end_pos].nil?
    #return false unless
    #&& (within_bound?(start) && within_bound?(end_pos)) #return false unless

  end

  def in_bounds?(pos)
    pos[0].between?(0,7) && pos[1].between?(0,7)
  end

  def rows
    @grid
  end
end
