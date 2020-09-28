class BinaryNode
    attr_accessor :value
    attr_accessor :left_node
    attr_accessor :right_node
    attr_accessor :ancestor

    def initialize (value = nil, left_node = nil, right_node = nil, ancestor = nil)
        @value = value
        @left_node = left_node
        @right_node = right_node
	    @ancestor = ancestor
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
        if temp.left_node != nil
            temp.left_node.ancestor = temp
        end
        if temp.right_node != nil
            temp.right_node.ancestor = temp
        end
        return temp
    end
    def insert (value, node = @root)
        if value == node.value
            return nil
        elsif value > node.value
            if node.right_node == nil
                node.right_node = BinaryNode.new(value,nil , nil, node)
            else
                insert value, node.right_node
            end
        else
            if node.left_node == nil
                node.left_node = BinaryTree.new(value,nil , nil, node)
            else
                insert value, node.left_node
            end
        end
    end
    def delete (value, node = @root)
        if node == nil
            return nil
        end
        if node.value == value
            if node.left_node == nil and node.right_node == nil
                if node.ancestor != nil
                    parent = node.ancestor
                    if parent.left_node != nil and parent.left_node.value == node.value
                        parent.left_node = nil
                    elsif parent.right_node != nil
                        parent.right_node = nil
                    end
                else
                    node.value = nil
                end
            elsif node.right_node == nil
                puts "left child case"
                ancestor = node.ancestor
                node.left_node.ancestor = ancestor
                if ancestor.left_node.value == node.value
                    ancestor.left_node = node.left_node
                else
                    ancestor.right_node = node.left_node
                end
            elsif node.left_node == nil
                puts "right child case"
                ancestor = node.ancestor
                node.right_node.ancestor = ancestor
                if ancestor.left_node.value == node.value
                    ancestor.left_node = node.right_node
                else
                    ancestor.right_node = node.right_node
                end
            else
                sup = node.right_node
                while sup.left_node != nil
                    sup = sup.left_node
                end
                sup_value = sup.value
                delete sup_value
                node.value = sup_value     
            end
        elsif node.value > value
            delete value, node.left_node
        elsif node.value < value
            delete value, node.right_node
        end
    end
    def PreOrder(node = @root)
        if node == nil
            return nil
        end
        puts "#{node.value}"
        if node.ancestor != nil
            puts "the ancestor value is #{node.ancestor.value}"
        end
        puts "going left for #{node.value}"
        PreOrder (node.left_node)
        puts "going right for #{node.value}"
        PreOrder (node.right_node)
    end
end

tree_4 = BinaryTree.new([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
tree_4.insert(11)
tree_4.delete(3)
tree_4.PreOrder