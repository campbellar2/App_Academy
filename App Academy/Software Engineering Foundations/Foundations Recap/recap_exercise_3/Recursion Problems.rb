# Recursion Problems

#multiply
#Write a method multiply(a, b) that takes in two numbers and returns their product.

#You must solve this recursively (no loops!)
#You must not use the multiplication (*) operator

def multiply(a, b)
     return 0 if a == 0
     return b if a == 1 
     return (0 - b) if (a == -1 && b < 0) || a == 1 && b > 0
     if a < 0 && b < 0 # both are negative
          (0 - b) + multiply((a + 1), b)
     elsif (a < 0 && b > 0) #only a is negative
          (0 - b) + multiply((a + 1), b)
     elsif (a > 0 && b < 0) #only b is negative
          b + multiply((a - 1), b)
     else  #both positive
          b + multiply((a - 1), b)
     end
end

# Examples
multiply(3, 5)        # => 15
multiply(5, 3)        # => 15
multiply(2, 4)        # => 8
multiply(0, 10)       # => 0
multiply(-3, -6)      # => 18
multiply(3, -6)       # => -18
multiply(-3, 6)       # => -18


#lucas_sequence
#The Lucas Sequence is a sequence of numbers. 
#The first number of the sequence is 2. 
#The second number of the Lucas Sequence is 1. 
#To generate the next number of the sequence, we add up the previous two numbers. 
#For example, the first six numbers of the sequence are: 2, 1, 3, 4, 7, 11, ...

#Write a method lucasSequence that accepts a number representing a length as an arg. 
#The method should return an array containing the Lucas Sequence up to the given length. Solve this recursively.

def lucas_sequence(num)
     return [] if num == 0
     return [2] if num == 1
     return [2, 1] if num == 2
     new_num = lucas_sequence(num - 1)[-1] + lucas_sequence(num -1)[-2]
     return lucas_sequence(num-1) << new_num
end

# Examples
lucas_sequence(0)   # => []
lucas_sequence(1)   # => [2]    
lucas_sequence(2)   # => [2, 1]
lucas_sequence(3)   # => [2, 1, 3]
lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]


#prime_factorization
#The Fundamental Theorem of Arithmetic states that every positive integer is either a prime or can be represented as a product of prime numbers.

#Write a method prime_factorization(num) that accepts a number and returns an array representing the prime factorization of the given number. 
#This means that the array should contain only prime numbers that multiply together to the given num. 
#The array returned should contain numbers in ascending order. 
#Do this recursively.

def prime_factorization(num)
     return [num] if prime?(num)
     if num % 2 == 0
          return prime_factorization(num / 2).unshift(2)
     elsif num % 3 == 0
          return prime_factorization(num / 3).unshift(3)
     elsif num % 5 == 0
          return prime_factorization(num / 5).unshift(5)
     end
end


def prime?(num)
     if num < 2
          return false
     end
 
     (2...num).each do |factor|
          if num % factor == 0
               return false
          end
     end
     return true
end

# Examples
p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]
