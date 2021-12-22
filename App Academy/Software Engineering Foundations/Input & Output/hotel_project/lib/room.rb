class Room
    def initialize(capacity)
        @capacity = capacity
        @occupants = Array.new
    end

    #getters
    def capacity
        @capacity
    end
    def occupants
        @occupants
    end

    def full?
        if @occupants.length < @capacity
            return false
        else
            return true
        end
    end
    def available_space
        space = @capacity - @occupants.length
        return space
    end

    def add_occupant(guest)
        if self.full?
            return false
        else
            @occupants << guest
            return true
        end
    end
end
