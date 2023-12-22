# frozen_string_literal: true

# Board class definition
class Board
  attr_reader :cells

  def initialize
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    show
  end

  def show
    puts <<-BOARD
      _______
      |#{@cells[0..2].join('|')}|
      |_ _ _|
      |#{@cells[3..5].join('|')}|
      |_ _ _|
      |#{@cells[6..8].join('|')}|
      _______
    BOARD
  end
end
