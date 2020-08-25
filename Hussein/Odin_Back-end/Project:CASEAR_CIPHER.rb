#we are only concerned with the alphabatical characters
#our logic will cycle so alphabits, and ignore special, control and numerical characters
#like z+1 = a not whatever successed it in the ascii table

def modulo (ascii_num, shift_number)#this function will "encrypt single characters only"
    if (ascii_num > 64 && ascii_num < 91) #we are checking if a character is lower case or not, if you are not sure, you may search online for ascii table, and you will know why the numbers 64 and 91, regarding how this check, well, the casear_cipher weill send to this function the ascii code of the character it process, bear till the end you will get it
        ascii_num = (ascii_num - 65 + shift_number) % 26 + 65
        #what is going on
        #well we get our lower case number in ascii encoding, which will be 65 till 90, and WE NEED TO CYCLE THROUGH alphabets only, so we substract 65, then we apply our shift, for obvious reasons, the modulo % is useful if say a z char with shift_number  = 4 (let us say) the ascii well be 30 which is out of our domain, here the modulo come the 30 will be 30%26 = 4, we are happy,
        #then we return the character to its set by adding 65
    elsif (ascii_num > 96 && ascii_num < 123)
        puts "#{ascii_num.chr}"
        ascii_num = (ascii_num - 97 + shift_number) % 26 + 97
        puts "#{ascii_num.chr}"
        #same as lower case
    end
    return ascii_num.chr#this method re-encode the ascii number into character and return it
end
def casear_cipher (plain_text, shift_number)
    #first we need to split the string into character array, since processing is easier such way
    plain_text.bytes.map { |ascii_num| modulo(ascii_num, shift_number) }.join("")
    #a quick refresh, #map applies a piece of code to every array's element
    # #bytes convert characters into their corresponding ascii numbers
end
puts "input your plain text"
plain_text = gets.chomp
puts "input your shift factor"
shift_factor = gets.to_i

puts "#{casear_cipher(plain_text, shift_factor)}"