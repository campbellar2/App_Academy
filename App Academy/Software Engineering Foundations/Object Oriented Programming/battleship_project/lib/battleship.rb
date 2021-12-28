require_relative "board"
require_relative "player"

class Battleship
     attr_reader :board, :player
     def initialize(n)
          @player = Player.new
          @board = Board.new(n)
          @remaining_misses = @board.size / 2
     end

     def start_game
          @board.place_random_ships
          puts "----------------------"
          puts "#{board.num_ships} ships left"
          puts
          @board.print
          puts
          puts "you have #{@remaining_misses} shots left"
     end

     def lose?
          if @remaining_misses <= 0
               puts "you lose!"
               return true
          else
               return false
          end
     end

     def win?
          if @board.num_ships == 0
               puts "you win!"
               return true
          else 
               return false
          end
     end

     def game_over?
          if self.lose? || self.win?
               return true
          else
               return false
          end
     end

     def turn
          shot = @player.get_move
          if @board.attack(shot)
               puts "----------------------"
               puts "#{board.num_ships} ships left"
               puts
               @board.print
               puts
               puts "you have #{@remaining_misses} shots left"
          else 
               puts "---------------------"
               puts "#{board.num_ships} ships left"
               puts
               @remaining_misses -= 1
               @board.print
               puts
               puts "you have #{@remaining_misses} shots left"
          end
     end
end
