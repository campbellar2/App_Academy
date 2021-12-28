class Board
     #PART 1
     attr_reader :size
     #class methods
     def self.print_grid(grid)
          grid.each do |row|
               puts row.join(" ")
          end
     end

     def initialize(n)
          @grid = Array.new(n) { Array.new(n, :N)}
          @size = n * n
     end

     def [](position)
          row, col = position
          return @grid[row] [col]
     end

     def []=(position, value)
          row, col = position
          @grid[row] [col] = value
     end

     def num_ships
          @grid.flatten.count { |ele| ele == :S }
     end

     #PART 2
     def attack(position)
          shot = self[position]
          if shot == :S
               self[position] = :H 
               puts "you sunk my battleship!"
               return true
          elsif shot == :X or shot == :H
               puts "you tried that position already"
               return true
          else
               self[position] = :X 
               puts "miss"
               return false
          end
     end

     def place_random_ships
          total_ships = (@size / 4)
          while self.num_ships < total_ships
               rand_row = rand(0...@grid.length)
               rand_col = rand(0...@grid.length)
               position = [rand_row, rand_col]

               self[position] = :S
          end
     end

     def hidden_ships_grid
          @grid.map do |row|
               row.map do |ele|
                    if ele != :S 
                         ele
                    else 
                         :N
                    end
               end
          end
     end

     def cheat
          Board.print_grid(@grid)
     end

     def print 
          Board.print_grid(self.hidden_ships_grid)
     end
end
