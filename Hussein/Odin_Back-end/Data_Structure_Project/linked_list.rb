class Node
    attr_accessor :value
    attr_accessor :next_node
    def initialize(value = nil, next_node = nil)
        @value = value
        @next_node = next_node
    end
end


class LinkedList
    attr_reader :head
    attr_reader :tail
    def initialize
        @head = nil
        @tail = nil
    end
    def append (value)
        temp = Node.new(value)
        if @head == nil
            @head = temp
            @tail = temp
        else
            node_before = @head
            node_after = node_before.next_node
            while node_after != nil
                node_before = node_after
                node_after = node_before.next_node
            end
            node_after = temp
            node_before.next_node = node_after
            @tail = node_after
        end
    end
    def prepend (value)
        temp = Node.new(value)
        
        temp.next_node = @head
        @head = temp
    end
    def size
        temp = @head
        size = 0
        while temp != nil
            temp = temp.next_node
            size += 1
        end
        size
    end
    def at index
        temp = @head
        while index > 0
            temp = temp.next_node 
            index -= 1
        end
        temp
    end
    def pop
        temp = @head
        while temp.next_node != @tail
            temp = temp.next_node
        end
        @tail = temp
        temp.next_node = nil
    end
    def contains? (value)
        temp = @head
        while temp.value != value
            temp = temp.next_node
            if temp == nil
                return false
            end
        end
        true
    end
    def find value
        temp = @head
        index = 0
        while temp != nil
            if temp.value == value
                return index
            end
            temp = temp.next_node
            index += 1
        end
        nil
    end
    def to_s
        temp = @head
        string = ""
        while temp != nil
            string.concat("(".concat(temp.value.to_s.concat(") -> ")))
            temp = temp.next_node
        end
        string.concat("nil")
    end
    def insert_at (value, index)
        temp = @head
        while temp != nil
            if index == 1
                temp.next_node = Node.new(value, temp.next_node)
                index = 0
                return nil
            end
            temp = temp.next_node
            index -= 1
        end
    end
    def remove_at (index)
        temp = @head
        if index == 0
            @head = temp.next_node
        else
            while temp.next_node != nil
                if index == 1
                    temp.next_node = temp.next_node.next_node
                end
                index -= 1
                temp = temp.next_node
            end
        end
    end     
end

my_list = LinkedList.new
my_list.append (10)
my_list.append (30)
my_list.append (40)
my_list.append (50)
my_list.prepend (1)
my_list.remove_at(5)
my_list.remove_at(0)
my_list.insert_at(20, 2)
my_list.insert_at(100, 10)

puts "#{my_list.size}"
puts "#{my_list.at(2).value}"
puts "#{my_list.contains? 20}"
puts "#{my_list.contains? 50}"
puts "#{my_list.find(40)}"
puts "#{my_list.find(23)}"
puts "#{my_list.to_s}"
puts "#{my_list.head.value}"
puts "#{my_list.tail.value}\n\n"
p my_list