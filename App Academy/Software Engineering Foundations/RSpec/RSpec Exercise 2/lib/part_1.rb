def partition(arr, num)
    greater = []
    less = []
    arr.each do |n|
        if n >= num 
            greater << n
        else
            less << n
        end
    end
    return [less, greater]
end


def merge(hash_1, hash_2)
    merged = {}
    hash_1.each do |k1, v1|
        merged[k1] = v1
    end
    hash_2.each do |k2, v2|
        merged[k2] = v2
    end
    return merged
end


def censor(sentence, array)
    vowels = "aeiou"
    words = sentence.split(" ")
    words.each do |word|
        if array.include?(word.downcase)
            word.downcase.each_char.with_index do |char, i| 
                if vowels.include?(char)
                    word[i] = "*"
                end
            end
        end
    end
    return words.join(" ")
end


def power_of_two?(num)
    i = 1
    while i < num
        i *= 2
    end
    if i == num
        return true
    end
    return false
end
