#what shall I say, bubble sort
def bubbler (number_array)
    temp = 0
    number_array.each_with_index do |number, i|
        number_array.each_with_index do |sub_num, j|
            if number_array[i] <= number_array[j]
                temp = number_array[i]
                number_array[i] = number_array[j]
                number_array[j] = temp
            end
        end
    end
end

num_array = [4,3,78,2,0,2,5,5,4,8,3,4,6,45,6,5,8,4,3]
puts "#{bubbler(num_array)}"