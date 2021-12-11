def palindrome?(string)
    reversed = ""
    i = 0
    while i < string.length
        char = string[i]
        reversed = char + reversed
        i += 1
    end
    reversed == string
end


def substrings(string)
    arr = []
    (0...string.length).each do |i|
        (i...string.length).each do |i2|
            arr << (string[i..i2])
        end
    end
    return arr
end


def palindrome_substrings(string)
    arr = substrings(string)
    new_arr = arr.select {|test| palindrome?(test) && test.length > 1}
    return new_arr
end
