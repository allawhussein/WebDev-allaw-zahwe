class BinaryNode
    attr_accessor :value
    attr_accessor :left_node
    attr_accessor :right_node

    def initialize (value = nil, left_node = nil, right_node = nil)
        @value = value
        @left_node = left_node
        @right_node = right_node
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
    attr_reader :root
    def initialize (array, array_length = nil)
        @root = build_tree(array, array_length)
    end
    def build_tree (array, array_length)
        if array_length == nil
            array_length = array.length 
        end
        if array_length == 1
            temp = BinaryNode.new(array[0])
        else
            temp = BinaryNode.new(
                array[array_length/2], 
                build_tree(array[0..array_length/2 - 1], array_length/2), 
                build_tree(array[array_length/2 + 1, array_length], array_length/2))
        end
    end
    def PreOrder(node = @root)
        if node == nil
            return nil
        end
        puts "#{node.value}"
        PreOrder (node.left_node)
        PreOrder (node.right_node)
    end
        
end