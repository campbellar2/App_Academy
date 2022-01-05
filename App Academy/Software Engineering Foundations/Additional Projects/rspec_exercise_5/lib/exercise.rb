def zip(*arrays)
     new_arr = Array.new(3) {Array.new}
     arrays.each do |arr|
          (0...arr.length).each do |i|
               new_arr[i] << arr[i]
          end
     end
     new_arr
end

def prizz_proc(arr, prc1, prc2)
     new_arr = []
     arr.each do |ele|
          new_arr << ele if (prc1.call(ele) && !prc2.call(ele)) || (prc2.call(ele) && !prc1.call(ele))
     end
     new_arr
end

def zany_zip(*arrays)
     count = 0
     i = 0
     arrays.each do |arr|
          count = arr.length if arr.length >= count
          i += 1
     end
     new_arr = Array.new(count) {Array.new(i, nil)}
     arrays.each_with_index do |arr, idx1|
          arr.each_with_index do |ele, idx2|
               new_arr[idx2][idx1] = ele
          end
     end
     new_arr
end

def maximum(arr, &prc)
     return nil if arr.length < 1
     (0...arr.length - 1).each do |i|
          first = arr[i]
          second = arr[i + 1]
          if prc.call(first) > prc.call(second)
               arr[i], arr[i + 1] = arr[i + 1], arr[i]
          end
     end
     arr.last
end

def my_group_by(arr, &prc)
     grouped = Hash.new { |hash, key| hash[key] = Array.new}
     arr.each do |ele|
          key = prc.call(ele)
          grouped[key] << ele
     end
     grouped
end

def max_tie_breaker(array, prc1, &prc2)
     return nil if array.length < 1
     (0...array.length - 1).each do |i|
          first = array[i]
          second = array[i + 1]
          if prc2.call(first) > prc2.call(second)
               array[i], array[i + 1] = array[i + 1], array[i]
          elsif prc2.call(first) == prc2.call(second)
               if prc1.call(first) >= prc1.call(second)
                    array[i], array[i + 1] = array[i + 1], array[i]
               end
          end
     end
     array.last
end

def silly_syllables(sentence)
     new_str = ""
     words = sentence.split
     indices = Hash.new {|hash, k| hash[k] = Array.new}
     vowels = "aeiou"
     words.each do |word|
          word.each_char.each_with_index do |char, i|
               indices[word] << i if vowels.include?(char)
          end
     end
     words.each do |word|
          if indices[word].length > 1
               new_str += word[indices[word][0]..indices[word][-1]] + " "
          else 
               new_str += word + " "
          end
     end
     new_str[0...-1]
end
