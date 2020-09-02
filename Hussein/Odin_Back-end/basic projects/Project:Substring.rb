#our objective is to write a fucntion that take an array and keyword as input
#our funtion will cycle dictionary works in the string using probably #include?
#I will test on "irb"

#so here what will happen
#we will split the string into substrings array
#and apply #include? at for every keyword
def substrings (string, dictionary)
    string = string.split(" ")

    hash = {}

    dictionary.each do |keyword|
        keyword.downcase!
        i = 0
        string.each do |subkeyword|
            subkeyword.downcase!
            if subkeyword.include?(keyword)
                i += 1
            end
        end
        if !(i == 0)
            hash.merge!(keyword => i)
        end
    end
    return hash
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts "#{substrings("Howdy partner, sit down! How's it going?", dictionary)}"