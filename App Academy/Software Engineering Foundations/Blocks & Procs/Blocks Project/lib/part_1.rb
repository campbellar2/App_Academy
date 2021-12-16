def select_even_nums(arr)
    arr.select(&:even?)
end


def reject_puppies(array)
    array.reject { |hash| hash["age"] <= 2}
end


def count_positive_subarrays(array)
    array.count { |sub_arr| sub_arr.sum > 0}
end


def aba_translate(string)
    vowels = "aeiou"
    arr = string.split("")
    translated = arr.map do |char| 
        if vowels.include?(char) 
            char = char + "b" + char
        else 
            char
        end
    end
    return translated.join("")
end


def aba_array(array)
    array.map { |word| aba_translate(word)}
end
