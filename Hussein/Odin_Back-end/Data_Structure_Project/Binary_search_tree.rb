class BinaryNode
    attr_accessor :value
    attr_accessor :left_node
    attr_accessor :right_node

    def initialize (value = nil)
        @value = value
        @left_node = nil
        @right_node = nil
    end
    def comaparable (node)
        begin
            if @value > node
                return true
            end
            return false
        rescue
            nil
        end
    end
end

class BinaryTree
    def initialize (array, array_length = nil)
        if array_length == nil
            array_length = array.length 
        end

    
end