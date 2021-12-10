def hipsterfy(word)
    vowels = "aeiou"
    reversed = word.reverse
    reversed.each_char.with_index do |char, i|
        if vowels.include?(char)
            reversed[i] = ""
            return reversed.reverse
        end
    end
    return word
end


def vowel_counts(str)
    vowels = "aeiou"
    counted = Hash.new(0)
    str.each_char do |char|
        if vowels.include?(char.downcase)
            counted[char.downcase] += 1
        end
    end
    return counted
end


def caesar_cipher(str, num)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    new_str = ""
    str.each_char do |char|
        if alphabet.include?(char)
            old_i = alphabet.index(char)
            new_i = old_i + num
            char = alphabet[new_i % 26]
            new_str += char
        else
            new_str += char
        end
    end
    return new_str
end
