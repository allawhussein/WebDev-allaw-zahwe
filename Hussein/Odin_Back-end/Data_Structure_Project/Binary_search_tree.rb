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
    def insert (value, node = @root)
        if value == node.value
            return nil
        elsif value > node.value
            if node.right_node == nil
                node.right_node = BinaryNode.new(value)
            else
                insert value, node.right_node
            end
        else
            if node.left_node == nil
                node.left_node = BinaryTree.new(value)
            else
                insert value, node.left_node
            end
        end
    end
    def PreOrder(node = @root, debug = 'no')
        if node == nil
            return nil
        end
        if debug == 'yes'
            puts "#{node.value}"
            puts "going left for #{node.value}"
        end
        PreOrder (node.left_node)
        if debug == 'yes'
            puts "going right for #{node.value}"
        end
        PreOrder (node.right_node)
    end
end

tree_4 = BinaryTree.new([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])

tree_4.insert 11
tree_4.insert 11
tree_4.insert 12
tree_4.insert 13
tree_4.insert 14
puts "\n#{tree_4.PreOrder}"

puts "#{tree_4.delete 11}"