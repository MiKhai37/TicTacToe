# frozen_string_literal: true

# Board class definition
# Manager cells and alignment of symbols
class Board
  attr_reader :cells

  def initialize
    @neutral = ' '
    init_cells
  end

  def init_cells
    @cells = Array.new(3) { Array.new(3, @neutral) }
    @lines = [[@cells[0][0], @cells[1][1], @cells[2][2]],
              [@cells[0][2], @cells[1][1], @cells[2][0]]] + @cells + @cells.transpose
  end

  # print the board in the console
  def show
    puts <<-BOARD
      -------
      |#{@cells[0].join('|')}|
      -------
      |#{@cells[1].join('|')}|
      -------
      |#{@cells[2].join('|')}|
      -------
    BOARD
  end

  def place(symbol, coords)
    @cells[coords[0]][coords[1]] = symbol
  end

  # if a 3 symbols are aligned return the symbol else return false
  def aligned_symbol?
    @lines.each do |line|
      return line.uniq.first if line.uniq.length == 1 && line.uniq.first != @neutral
    end
    false
  end
end
