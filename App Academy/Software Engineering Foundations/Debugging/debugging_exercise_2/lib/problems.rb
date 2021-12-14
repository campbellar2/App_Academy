# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
    i = num
    while i > 1
        if num % i == 0 && prime?(i)
            return i
        end
        i -= 1
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



def unique_chars?(string)
    count = Hash.new(0)
    string.each_char do |char|
        count[char] += 1
    end
    count.each_value {|v| return false if v != 1}
    return true
end


def dupe_indices(array)
    count = Hash.new(0)
    counted_indices = {}
    array.each do |char|
        count[char] += 1
    end
    count.each do |k, v|
        if v > 1
            counted_indices[k] = dupe(array, k)
        end
    end
    return counted_indices
end

def dupe(arr, char)
    new_Arr = []
    arr.each_with_index do |ele, i|
        new_Arr << i if ele == char
    end
    return new_Arr
end

def ana_array(array_1, array_2)
    count1 = Hash.new(0)
    count2 = Hash.new(0)
    array_1.each do |ele1|
        count1[ele1] += 1
    end
    array_2.each do |ele2|
        count2[ele2] += 1
    end
    if count1 == count2
        return true
    end
    false
end
