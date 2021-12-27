class Code
     #PART 1
     attr_reader :pegs

     POSSIBLE_PEGS = {
          "R" => :red,
          "G" => :green,
          "B" => :blue,
          "Y" => :yellow
     }

     def self.valid_pegs?(chars)
          chars.all? { |char| POSSIBLE_PEGS.has_key?(char.upcase)}
     end

     def self.random(length)
          random_pegs = []
          length.times { random_pegs << POSSIBLE_PEGS.keys.sample}
          Code.new(random_pegs)
     end

     def self.from_string(string)
          chars = string.upcase.split("")
          Code.new(chars)
     end


     def initialize(chars)
          if !Code.valid_pegs?(chars)
               raise "invalid pegs"
          else
               @pegs = chars.map(&:upcase)
          end
     end

     def [](index)
          @pegs[index]
     end

     def length
          return @pegs.length
     end

     #PART 2
     def num_exact_matches(guess)
          count = 0
          (0...guess.length).each do |i|
               count += 1 if guess[i] == self[i]
          end
          return count
     end

     def num_near_matches(guess)
          count = 0
          code_hash = Hash.new(0)
          self.pegs.each { |peg| code_hash[peg] += 1}
          guess.pegs.each do |peg|
               if code_hash.has_key?(peg) && code_hash[peg] > 0
                    code_hash[peg] -= 1
                    count += 1
               end
          end
          count - num_exact_matches(guess)
     end

     def ==(guess)
          return true if guess.pegs == self.pegs
          false
     end
end
