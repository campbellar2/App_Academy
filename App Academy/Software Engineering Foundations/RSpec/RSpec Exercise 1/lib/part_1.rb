def average(num1, num2)
    (num1 + num2) / 2.0
end


def average_array(arr)
    sum = 0
    arr.each { |num| sum += num}
    return sum / arr.length.to_f
end


def repeat(str, num)
    repeated = ""
    num.times {repeated += str}
    return repeated
end


def yell(str)
    return str.upcase + "!"
end


def alternating_case(sentence)
    words = sentence.split(" ")
    words.map.with_index do |word, i|
        if i % 2 == 0
            word.upcase!
        else 
            word.downcase!
        end
    end
    return words.join(" ")
end
