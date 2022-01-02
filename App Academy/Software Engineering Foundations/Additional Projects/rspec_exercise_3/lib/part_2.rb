#PART 2

def element_count(arr)
     count = Hash.new(0)
     arr.each do |ele|
          count[ele] += 1
     end
     count
end

def char_replace!(str, hash)
     (0...str.length).each do |i|
          if hash.keys.include?(str[i])
               str[i] = hash[str[i]]
          end
     end
     return str
end

def product_inject(arr)
     arr.inject { |acc, ele| acc * ele} 
end
