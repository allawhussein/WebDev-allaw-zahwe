class Pair
    attr_accessor :x
    attr_accessor :y

    def initialize (x = nil, y = nil)
        @x = x
        @y = y
    end
end

def valid_move_array query
    valid_array = []
    for square in query
        if square.x + 2 <= 8
            if square.y + 1 < 8
                valid_array.push Pair.new square.x + 2, square.y + 1
            end
            if square.y - 1 > 0
                valid_array.push Pair.new square.x + 2, square.y - 1
            end
        end
        if square.x - 2 > 0
            if square.y + 1 < 8
                valid_array.push Pair.new square.x - 2, square.y + 1
            end
            if square.y - 1 > 0
                valid_array.push Pair.new square.x - 2, square.y - 1
            end
        end

        if square.x + 1 <= 8
            if square.y + 2 < 8
                valid_array.push Pair.new square.x + 1, square.y + 2
            end
            if square.y - 2 > 0
                valid_array.push Pair.new square.x + 1, square.y - 2
            end
        end
        if square.x - 1 > 0
            if square.y + 2 < 8
                valid_array.push Pair.new square.x - 1, square.y + 2
            end
            if square.y - 2 > 0
                valid_array.push Pair.new square.x - 1, square.y - 2
            end
        end
    end
    valid_array
end

def includepair array, target
    for x in array
        if x.x == target.x and x.y == target.y
            return true
        end
    end
    return false
end

array = []
array.push Pair.new 4, 4
target = Pair.new 1, 1
distance = 0
puts includepair array, target
while !includepair array, target
    distance += 1
    array = valid_move_array array
    puts distance
end

puts distance