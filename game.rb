# frozen_string_literal: true

require_relative 'player'
require_relative 'board'

# Game class definition
# Manage game logic
class Game
  def initialize
    puts 'Welcome to Tic Tac Toe Game\n'
    @players = [Player.new('Bob', 'X'), Player.new('Alice', 'O')]
    @board = Board.new
    @round = 0
    @end_game = false
    game_loop
  end

  def start
    @current = rand(2) == 1 ? @players[0] : @players[1]
    @board.init_cells
    @round += 1
    show_round_score
  end

  def win?
    if (win_symbol = @board.aligned_symbol?)
      @players.detect { |player| player.symbol == win_symbol }.win
      true
    else
      false
    end
  end

  def show_round_score
    puts "Round ##{@round}"
    @players.each { |player| puts player }
  end

  def game_loop
    until @end_game
      start
      until win?
        puts "\n#{@current.name} (#{@current.symbol})\nEnter coordinates x y:"
        @board.place(@current.symbol, gets.chomp.split(' ').map(&:to_i))
        @current = @current == @players[0] ? @players[1] : @players[0]
      end
      puts '\nAnother game? (y/N)'
      @end_game = gets.chomp.downcase != 'y'
    end
  end
end
