puts "this is a forever loop wiht condition"

i = 0
loop do
    puts "i is #{i}"
    i += 1
    break if i == 20
end

puts "this is a counting while loop"

i = 0
while i < 10 do
    puts "i is #{i}"
    i += 1
end

puts "this is a conditioned while loop, enter yes to exit"

while gets.chomp != "yes" do
    puts "will you go wiht me?"
end

puts "this is an until loop, basiclly it is a while not, it will continue as long as condtion is false"

i = 0
until i > 10 do
    puts "i is #{i}"
    i +=1
end

puts "similar example to the conditioned loop, but with until"

until gets.chomp == "yes" do
    puts "will you go with me?"
end

puts "\nRanges\nsimilar to python ranges\nand so is the for loop\n"
puts "this is a for loop with range (1..5)\n"

for i in 0..5
    puts "#{i} errors coming!"
end

puts "\nthis is a for loop with range (1...5)\n"

for i in 0...5
    puts "#{i} errors coming!"
end

puts "\nthis is the times loop\n"

5.times do
    puts "timesloop\n"
end

puts "\n this is the times loop but with variable\n"

5.times do |x|
    puts "times loop #{x}"
end

puts"\n\nnow for the upto downto loops"

5.upto(10){|num| print "#{num}"}

10.downto(5) {|num| print "#{num}"}

puts "\n\n\n\nwe are done"