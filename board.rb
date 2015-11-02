require_relative 'piece.rb'

class Board

  attr_accessor :grid

  def initialize(grid = Array.new(8) {Array.new(8)} )
    @grid = grid
    Board.populate
  end

  def self.populate
    lines_with_pieces = [0,1,6,7]

    lines_with_pieces.each do |line|
      line.each do |pos|
        pos << Piece.new("pawn")
      end
    end
  end
end
