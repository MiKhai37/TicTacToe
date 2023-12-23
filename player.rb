# frozen_string_literal: true

# Player class Definition
# Manage player name and symbol and track player score
class Player
  attr_reader :name, :symbol, :score

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @score = 0
  end

  def win
    puts "Congratulation #{@name} you win!!!"
    @score += 1
  end
end
