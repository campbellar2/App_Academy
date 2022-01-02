#PART 1

require "prime"
def is_prime?(num)
     return false if num < 2
     (2...num).each { |fact| return false if num % fact == 0}
     true
end


def nth_prime(n)
     return Prime.take(n).last
end

def prime_range(min, max)
     primes = []
     (min..max).each do |num|
          primes << num if is_prime?(num)
     end
     primes
end
