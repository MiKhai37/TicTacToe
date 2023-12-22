# frozen_string_literal: true

# Player class Definition
class Player
  attr_reader :name, :symbol, :score

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @score = 0
    puts "Player #{@name} plays with #{@symbol} symbol"
  end

  def win
    @score += 1
  end
end
