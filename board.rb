
require_relative 'piece.rb'

class Board

  attr_accessor :grid, :white_king_spot, :black_king_spot

  def initialize(grid = Array.new(8) {Array.new(8)} )
    @grid = grid
    @white_king_spot = [7,3]
    @black_king_spot = [0,3]
    populate_other_pieces
    populate_pawns
  end

  def [](pos)
    @grid[pos[0]][pos[-1]]
  end

  def []=(pos, value)
    @grid[pos[0]][pos[-1]] = value
  end

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
    order = [Rook, Knight, Bishop, King, Queen, Bishop, Knight, Rook]

    @grid[0].each_index do |i|
      self[[0, i]] = order[i].new([0, i], :black, self)
    end

    @grid[7].each_index do |i|
      self[[7, i]] = order[i].new([7, i], :white, self)
    end
  end

  def in_check?(color)
    color == :black ? king_spot = @black_king_spot : king_spot = @white_king_spot
    @grid.each do |row|
      row.each do |space|
        unless space.nil?
          return true if space.moves.include?(king_spot) && space.color != color
        end
      end
    end
    false
  end

  def in_bounds?(pos)
    pos[0].between?(0,7) && pos[1].between?(0,7)
  end

  def move(start, end_pos)
    if !self[start].nil?
      if self[start].moves.include?(end_pos)
        self.white_king_spot = end_pos if self[start].type == :king && self[start].color == :white
        self.black_king_spot = end_pos if self[start].type == :king && self[start].color == :black
        self[end_pos] = self[start]
        self[start].pos = end_pos
        self[start] = nil
      else
        puts "Invalid move."
      end
    else
      puts "Invalid move."
    end
  end

  def rows
    @grid
  end
end
