require 'colorize'
require_relative 'board.rb'
require_relative 'cursorable.rb'

class Display
  include Cursorable

  attr_reader :board
  attr_accessor :cursor_pos, :selected

  def initialize(board)
   @board = board
   @cursor_pos = [0, 0]
   @selected = nil
  end

  def build_grid
    @board.rows.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j)
      piece.type.to_s.colorize(color_options)
    end
  end

  def colors_for(i, j)
    if [i, j] == @cursor_pos
      bg = :light_red
    elsif (i + j).odd?
      bg = :light_blue
    elsif [i, j] == @selected
      bg = :yellow
    else
      bg = :blue
    end
    { background: bg, color: :white }
  end

  def render
    system("clear")
    puts "Fill the grid!"
    puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
    build_grid.each {|row| puts row.join}
  end

  def move
    result = nil
    until result
      self.render
      result = self.get_input
    end
    result
  end
end

if $PROGRAM_NAME == __FILE__
  disp = Display.new(board = Board.new)
  disp.move
  disp.move
  disp.move
end
