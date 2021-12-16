def my_map(array, &prc)
    new_Arr = []
    array.each do |ele|
        new_Arr << prc.call(ele)
    end
    new_Arr
end


def my_select(array, &prc)
    new_Arr = []
    array.each do |ele|
        if prc.call(ele)
            new_Arr << ele
        end
    end
    new_Arr
end


def my_count(array, &prc)
    count = 0
    array.each do |ele|
        if prc.call(ele)
            count += 1
        end
    end
    count
end


def my_any?(array, &prc)
    array.each do |ele|
        if prc.call(ele)
            return true
        end
    end
    return false
end


def my_all?(array, &prc)
    array.each do |ele|
        if !prc.call(ele)
            return false
        end
    end
    return true
end


def my_none?(array, &prc)
    array.each do |ele|
        if prc.call(ele)
            return false
        end
    end
    return true
end
