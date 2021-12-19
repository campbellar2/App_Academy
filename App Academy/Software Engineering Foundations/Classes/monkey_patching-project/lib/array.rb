# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    #PART 1
    def span
        return nil if self.empty?
        return self.max - self.min
    end

    def average
        return nil if self.empty?
        return ((self.sum * 1.00) / (self.length * 1.00))
    end

    def median
        sorted = self.sort
        if sorted.empty?
            return nil
        elsif sorted.length.even?
            mid = (sorted.length / 2)
            return (sorted[mid] + sorted[mid - 1]) / 2.0
        else
            mid = (sorted.length / 2)
            return sorted[mid]
        end
    end

    def counts
        counted = Hash.new(0)
        self.each do |ele|
            counted[ele] += 1
        end
        return counted
    end

    #PART 2
    def my_count(value)
        count = 0
        self.each do |ele|
            if ele == value
                count += 1
            end
        end
        count
    end

    def my_index(value)
        self.each_with_index do |ele, i|
            if ele == value
                return i
            end
        end
        nil
    end

    def my_uniq
        new_arr = []
        self.each do |ele|
            new_arr << ele if !new_arr.include?(ele)
        end
        new_arr
    end

    def my_transpose
        transposed = []
        
        self.length.times do
            transposed << []
        end
        self.each_with_index do |subarray, index|
            subarray.each_with_index do |ele, i|
                transposed[i] << ele
            end
        end
        transposed
    end
end
