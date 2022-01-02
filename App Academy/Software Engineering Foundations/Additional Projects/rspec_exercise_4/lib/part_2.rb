#PART 2

def proper_factors(num)
     factors = []
     (1...num).each do |fact|
          factors << fact if num % fact == 0
     end
     factors
end

def aliquot_sum(num)
     return proper_factors(num).sum
end

def perfect_number?(num)
     num == aliquot_sum(num)
end

def ideal_numbers(n)
     new_arr = []
     (1..2147483647).each do |num|
          new_arr << num if perfect_number?(num)
          break if new_arr.length == n
     end
     new_arr
end
