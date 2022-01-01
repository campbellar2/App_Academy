# General Problems

#no_dupes?
#Write a method no_dupes?(arr) that accepts an array as an arg and returns an new array containing the elements that were not repeated in the array.

def no_dupes?(arr)
     new_arr = []
     hash = Hash.new(0)
     arr.each do |ele|
          hash[ele] += 1
     end
     hash.each do |k, v|
          if v == 1
               new_arr << k
          end
     end
     new_arr
end

# Examples
no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
no_dupes?([true, true, true])            # => []


#no_consecutive_repeats?
#Write a method no_consecutive_repeats?(arr) that accepts an array as an arg. 
#The method should return true if an element never appears consecutively in the array; it should return false otherwise.

def no_consecutive_repeats?(arr)
     (0...(arr.length - 1)).each do |i|
          return false if arr[i] == arr[i + 1]
     end
     true
end

# Examples
no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
no_consecutive_repeats?(['x'])                              # => true


#char_indices
#Write a method char_indices(str) that takes in a string as an arg. 
#The method should return a hash containing characters as keys. 
#The value associated with each key should be an array containing the indices where that character is found.

def char_indices(str)
     indices = Hash.new { |hash, k| hash[k] = []}
     str.each_char.with_index do |char, i|
          indices[char] << i
     end
     indices
end

# Examples
char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}


#longest_streak
#Write a method longest_streak(str) that accepts a string as an arg. 
#The method should return the longest streak of consecutive characters in the string. 
#If there are any ties, return the streak that occurs later in the string.

def longest_streak(str)
     real_longest = ""
     temp_longest = ""
     str.each_char.with_index do |char, i|
          if i == 0
               real_longest += char
          elsif char == real_longest[-1]
               real_longest += char 
          elsif char != real_longest[-1] 
               if char == temp_longest[-1]
                    temp_longest += char 
               else
                    temp_longest = ""
                    temp_longest += char
               end
               if temp_longest.length >= real_longest.length
                    real_longest = temp_longest
                    temp_longest = ""
               end
          end
     end
     return real_longest
end

# Examples
longest_streak('a')           # => 'a'
longest_streak('accccbbb')    # => 'cccc'
longest_streak('aaaxyyyyyzz') # => 'yyyyy
longest_streak('aaabbb')      # => 'bbb'
longest_streak('abc')         # => 'c'

#bi_prime?
#Write a method bi_prime?(num) that accepts a number as an arg and returns a boolean indicating whether or not the number is a bi-prime. 
#A bi-prime is a positive integer that can be obtained by multiplying two prime numbers.

#For Example:

#14 is a bi-prime because 2 * 7
#22 is a bi-prime because 2 * 11
#25 is a bi-prime because 5 * 5
#24 is not a bi-prime because no two prime numbers have a product of 24

def bi_prime?(num)
     (2...num).each do |div1|
          (2...num).each do |div2|
               if div1 * div2 == num && prime?(div1) && prime?(div2)
                    return true
               end
          end
     end
     false
end

def prime?(num)
     if num < 2
          return false
     elsif num == 2
          return true
     end
 
     (3...num).each do |factor|
          if num % factor == 0
               return false
          end
     end
     return true
end

# Examples
bi_prime?(14)   # => true
bi_prime?(22)   # => true
bi_prime?(25)   # => true
bi_prime?(94)   # => true
bi_prime?(24)   # => false
bi_prime?(64)   # => false


#vigenere_cipher
#A Caesar cipher takes a word and encrypts it by offsetting each letter in the word by a fixed number, called the key. 
#Given a key of 3, for example: a -> d, p -> s, and y -> b.

#A Vigenere Cipher is a Caesar cipher, but instead of a single key, a sequence of keys is used. 
#For example, if we encrypt "bananasinpajamas" with the key sequence 1, 2, 3, then the result would be "ccqbpdtkqqcmbodt":

# Message:  b a n a n a s i n p a j a m a s
# Keys:     1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1
# Result:   c c q b p d t k q q c m b o d t
#Write a method vigenere_cipher(message, keys) that accepts a string and a key-sequence as args, returning the encrypted message. 
#Assume that the message consists of only lowercase alphabetic characters.

def vigenere_cipher(message, keys)
     alphabet = ("a".."z").to_a
     ciphered = ""
     count = 0
     message.each_char do |char|
          old_i = alphabet.index(char)
          new_i = old_i + keys[count % keys.length]
          char = alphabet[new_i % 26]
          ciphered += char
          count += 1
     end

     return ciphered
end

# Examples
vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
vigenere_cipher("zebra", [3, 0])            # => "ceerd"
vigenere_cipher("yawn", [5, 1])             # => "dbbo


#vowel_rotate
#Write a method vowel_rotate(str) that accepts a string as an arg and returns the string 
#where every vowel is replaced with the vowel that appears before it sequentially in the original string. 
#The first vowel of the string should be replaced with the last vowel.

def vowel_rotate(str)
     vowels = "aeiou"
     str_vowels = ""
     new_str = ""
     count = 0

     str.each_char do |char|
          if vowels.include?(char)
               str_vowels += char
          end
     end

     str_vowels = str_vowels[-1] + str_vowels.chop

     str.each_char do |char|
          if vowels.include?(char)
               char = str_vowels[count]
               new_str += char 
               count += 1
          else 
               new_str += char
          end
     end
     return new_str
end 

# Examples
vowel_rotate('computer')      # => "cempotur"
vowel_rotate('oranges')       # => "erongas"
vowel_rotate('headphones')    # => "heedphanos"
vowel_rotate('bootcamp')      # => "baotcomp"
vowel_rotate('awesome')       # => "ewasemo"
