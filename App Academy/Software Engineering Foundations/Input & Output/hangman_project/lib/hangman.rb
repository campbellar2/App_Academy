class Hangman
    DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
    def self.random_word
        DICTIONARY.sample
    end

    def initialize
        @secret_word = Hangman.random_word
        @guess_word = Array.new(@secret_word.length, "_")
        @attempted_chars = []
        @remaining_incorrect_guesses = 5
    end

    #getters
    def guess_word
        @guess_word
    end
    def attempted_chars
        @attempted_chars
    end
    def remaining_incorrect_guesses
        @remaining_incorrect_guesses
    end

    def already_attempted?(char)
        attempted_chars.include?(char)
    end

    def get_matching_indices(char)
        matching_indices = []
        @secret_word.each_char.with_index do |ele, i|
            if ele == char
                matching_indices << i
            end
        end
        matching_indices
    end

    def fill_indices(char, array)
        array.each do |index|
            @guess_word[index] = char
        end
    end

    #PART 2
    def try_guess(char)
        if self.already_attempted?(char)
            p "that has already been attempted"
            return false
        else 
            indices = get_matching_indices(char)
            attempted_chars << char
            @remaining_incorrect_guesses -= 1 if indices.empty?
            self.fill_indices(char, indices)
            return true
        end
    end

    def ask_user_for_guess
        puts "Enter a char:"
        return self.try_guess(gets.chomp)
    end

    def win?
        if @guess_word.join("") == @secret_word
            puts "WIN"
            return true
        else
            return false
        end
    end
    def lose?
        if @remaining_incorrect_guesses == 0
            p "LOSE"
            return true
        else
            return false
        end
    end

    def game_over?
        if self.win? || self.lose?
            p @secret_word
            return true
        else
            return false
        end
    end
end
