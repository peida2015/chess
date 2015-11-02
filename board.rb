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

  def populate
    lines_with_pieces = [0,1,6,7]

    lines_with_pieces.each do |line|
      @grid[line].each_index do |i|
        self[[line, i]] = Piece.new("pawn", [line, i])
      end
    end
  end

  def move(start, end_pos)
    self[end_pos]= self[start]
    self[end_pos].pos = end_pos
    self[start] = nil
  end
end
