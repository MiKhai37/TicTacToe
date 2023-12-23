# frozen_string_literal: true

# Board class definition
# Manager cells and alignment of symbols
class Board
  NEUTRAL = ' '

  def initialize; end

  def init_cells
    @cells = Array.new(3) { Array.new(3, NEUTRAL) }
    @lines = [[@cells[0][0], @cells[1][1], @cells[2][2]],
              [@cells[0][2], @cells[1][1], @cells[2][0]]] + @cells + @cells.transpose
    puts self
  end

  # print the board in the console
  def to_s
    <<-BOARD
       _ _ _
      |#{@cells[0].join('|')}|
       _ _ _
      |#{@cells[1].join('|')}|
       _ _ _
      |#{@cells[2].join('|')}|
       _ _ _
    BOARD
  end

  # Place a player symbol and show the result
  def place(symbol, coords)
    check_validity(coords)
    @cells[coords[0] - 1][coords[1] - 1] = symbol
    puts self
  end

  def check_validity(coords)
    return unless @cells[coords[0] - 1][coords[1] - 1] != NEUTRAL

    puts 'Illegal Move !!!'
  end

  # if a 3 symbols are aligned return the symbol else return false
  def aligned_symbol?
    @lines.each do |line|
      return line.uniq.first if line.uniq.length == 1 && line.uniq.first != NEUTRAL
    end
    false
  end
end
