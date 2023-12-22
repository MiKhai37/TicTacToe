# frozen_string_literal: true

require_relative 'player'
require_relative 'board'

# Game class definition
class Game
  attr_accessor :player1, :player2, :current_player

  def initialize
    @player1 = Player.new('Bob', 'X')
    @player2 = Player.new('Alice', 'O')
    @current_player = rand(2) == 1 ? player1 : player2
    @board = Board.new

    puts "Game Initialized, it's the turn of #{current_player.name} #{current_player.symbol}"
  end
end
