# frozen_string_literal: true

# Board class definition
class Board
  attr_reader :cells

  def initialize
    @neutral = ' '
    @cells = Array.new(3) { Array.new(3, @neutral) }
    @cells = [%w[O O O], [4, 5, 6], [7, 8, 9]]
  end

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

  def play(symbol, place)
    @cells[place] = symbol
  end

  def line?
    diags = [[@cells[0][0], @cells[1][1], @cells[2][2]], [@cells[0][2], @cells[1][1], @cells[2][0]]]
    (@cells + @cells.transpose + diags).each do |line|
      return line.uniq.first if line.uniq.length == 1 && line.uniq.first != @neutral
    end
    false
  end
end
