# frozen_string_literal: true

require_relative 'player'
require_relative 'board'

# Game class definition
# Manage game logic
class Game
  def initialize
    @players = [Player.new('Bob', 'X'), Player.new('Alice', 'O')]
    @current = rand(2) == 1 ? @players[0] : @players[1]
    @board = Board.new
    @round = 0
    @end_game = false

    game_loop
  end

  def restart
    @current = rand(2) == 1 ? @players[0] : @players[1]
    @board.init_cells
    @round += 1
  end

  def show_turn
    puts "\n#{@current.name} (#{@current.symbol}) it's your turn\n"
    puts 'Enter coordinates x y'
  end

  def win?
    if (win_symbol = @board.aligned_symbol?)
      winner = @players.detect { |player| player.symbol == win_symbol }
      winner.win
      return true
    end
    false
  end

  def show_round_score
    puts "\nRound ##{@round}"
    puts 'Score:'
    @players.each { |player| puts "#{player.name} (#{player.symbol}): #{player.score}" }
  end

  def game_loop
    puts 'Welcome to Tic Tac Toe Game'

    until @end_game
      show_round_score

      until win?
        show_turn
        @board.show
        @board.place(@current.symbol, gets.chomp.split(' ').map(&:to_i))
        @current = @current == @players[0] ? @players[1] : @players[0]
      end
      puts 'Do you want to play another game? (y/N)'
      @end_game = gets.chomp.downcase != 'y'
      restart
    end
  end
end
