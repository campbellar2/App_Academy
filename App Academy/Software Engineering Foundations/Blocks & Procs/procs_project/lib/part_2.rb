def reverser(string, &prc)
    prc.call(string.reverse)
end


def word_changer(sentence, &prc)
    arr = sentence.split(" ")
    changed = []
    arr.each do |word|
        changed << prc.call(word)
    end
    changed.join(" ")
end


def greater_proc_value(num, proc_1, proc_2)
    result1 = proc_1.call(num)
    result2 = proc_2.call(num)
    if result1 > result2
        return result1
    else
        return result2
    end
end


def and_selector(array, proc_1, proc_2)
    array.select {|ele| proc_1.call(ele) && proc_2.call(ele)}
end


def alternating_mapper(array, proc_1, proc_2)
    new_array = []
    array.each_with_index do |ele, i|
        if i % 2 == 0
            new_array << proc_1.call(ele)
        else 
            new_array << proc_2.call(ele)
        end
    end
    new_array
end
