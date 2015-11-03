require_relative 'piece.rb'

class Board

  attr_accessor :grid

  def initialize(grid = Array.new(8) {Array.new(8)} )
    @grid = grid
    populate
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

  def populate
    lines_with_pieces = [0,1,2,3,4,5,6,7]

    lines_with_pieces.each do |line|
      @grid[line].each_index do |i|
        self[[line, i]] = Piece.new("pawn", [line, i])
      end
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
