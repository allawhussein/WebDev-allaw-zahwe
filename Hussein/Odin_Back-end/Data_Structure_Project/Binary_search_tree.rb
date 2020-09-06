class BinaryNode
    attr_accessor :value
    attr_accessor :left_node
    attr_accessor :right_node

    def initialize (value = nil, left_node = nil, right_node = nil)
        @value = value
        @left_node = left_node
        @right_node = right_node
    end
end

class BinaryTree
    attr_reader :root
    def initialize (array)
        @root = build_tree(array)
    end
    def build_tree (array)
        array_length = array.length 
        
        if array_length == 1
            temp = BinaryNode.new(array[0])
        else
            value = array[array_length/2]
            left_node = array.take(array_length/2)
            right_node = array.drop(array_length/2 + 1)

            if left_node.empty?
                left_node = nil
            else
                left_node = build_tree left_node
            end
            if right_node.empty?
                right_node = nil
            else
                right_node = build_tree right_node
            end

            temp = BinaryNode.new(value, left_node, right_node)
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

tree_1 = BinaryTree.new([1])
tree_2 = BinaryTree.new([1, 2])
tree_3 = BinaryTree.new([1, 2, 3])
tree_4 = BinaryTree.new([1, 2, 3, 4])

puts "#{tree_1.PreOrder}"
puts "\n#{tree_2.PreOrder}"
puts "\n#{tree_3.PreOrder}"
puts "\n#{tree_4.PreOrder}"