require_relative "room"

class Hotel
    def initialize(name, capacities)
        @name = name
        @rooms = {}
        capacities.each do |room_name, capacity|
            @rooms[room_name] = Room.new(capacity)
        end
    end

    #getters
    def name
        words = @name.split(" ")
        words.each { |word| word.capitalize!}
        return words.join(" ")
    end
    def rooms
        @rooms
    end

    def room_exists?(name)
        @rooms.has_key?(name)
    end

    def check_in(person, room)
        if !self.room_exists?(room)
            p "sorry, room does not exist"
        else
            if @rooms[room].add_occupant(person)
                p "check in successful"
            else
                p "sorry, room is full"
            end
        end
    end
    
    def has_vacancy?
        @rooms.values.any? { |room| room.available_space > 0}
    end

    def list_rooms
        list = ""
        @rooms.each do |name, instance|
            list += "#{name} : #{instance.available_space()}\n"
        end
        puts list
    end
end
