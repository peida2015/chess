require 'colorize'
require_relative 'board.rb'
require_relative 'cursorable.rb'

class Display

  UNICODE = {:rook => "\u{2656}", :bishop => "\u{2657}", :knight => "\u{2658}",
            :pawn => "\u{2659}", :king => "\u{2654}", :queen => "\u{2655}"}

  UNICODE_BLACK = {:rook => "\u{265C}", :bishop => "\u{265D}", :knight => "\u{265E}",
            :pawn => "\u{265F}", :king => "\u{265A}", :queen => "\u{265B}"}

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
      if piece
        if piece.color == :white
        " #{UNICODE[piece.type]}  ".colorize(color_options)
        elsif piece.color == :black
        " #{UNICODE_BLACK[piece.type]}  ".colorize(color_options)
        end
      else
        "    ".colorize(color_options)
      end
    end
  end

  def colors_for(i, j)
    if [i, j] == @cursor_pos
      bg = :light_red
    elsif [i, j] == @selected
      bg = :yellow
    elsif (i + j).odd?
      bg = :blue
    else
      bg = :light_blue
    end

    if board[[i,j]]
      piece_color = board[[i,j]].color
    end
    { background: bg, color: piece_color }
  end

  def render
    system("clear")
    # puts "Fill the grid!"
    puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
    build_grid.each {|row| puts row.join}
  end

  def move
    result1 = nil
    result2 = nil
    until result1
      self.render
      result1 = self.get_input
    end
    until result2
      self.render
      result2 = self.get_input
    end
    @board.move(result1, result2)
  end
end

if $PROGRAM_NAME == __FILE__
  load 'manifest.rb'
  disp = Display.new(board = Board.new)
  10.times {disp.move }
  p disp.board.in_check?(:black) #{@board.black_king_spot}"
end
