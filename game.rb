# frozen_string_literal: true

require_relative 'player'
require_relative 'board'

# Game class definition
class Game
  attr_accessor :players, :current_player

  def initialize
    @players = [Player.new('Bob', 'X'), Player.new('Alice', 'O')]
    @current_player = rand(2) == 1 ? players[0] : players[1]
    @board = Board.new
    @winner = nil

    puts "\n#{current_player.name} it's your turn\n"
    @board.show
  end

  def win?
    win_symbol = @board.line?
    if win_symbol
      players.each { |player| @winner = player if player.symbol == win_symbol }
      p "Congratulation #{@winner.name} you win!!!"
      return win_symbol
    end
    false
  end
end
