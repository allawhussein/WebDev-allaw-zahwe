#this program will take a string, shift_factor and output the cipher text
puts "input your plain text"
plain_text = gets.chomp
#plain_text = plain_text.split("")#this line turns "string" into iterable ["s", "t", "r", "i", "n", "g"]
puts "input your shitf_factor"
shift_factor = gets.to_i #convert the string into integer

cipher_text = []
plain_text = plain_text.bytes
plain_text.each do |letter|
    puts "#{letter}"
    cipher_text.push(letter.chr)
end

cipher_text = cipher_text.join("")
puts cipher_text