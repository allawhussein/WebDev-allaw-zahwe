my_hash = { 
  "a random word" => "ahoy", 
  "Dorothy's math test score" => 94, 
  "an array" => [1, 2, 3],
  "an empty hash within a hash" => {} 
}

# we can define your_hash as
your_hash = Hash.new
your_hash #=> {}

#access the values of hash
my_hash["a random word"] #=> "ahoy"

my_hash["i do not know"] #=> nil

#instead of getting cumbersome "nil"
my_hash.fetch("i do not know") #=> KeyError: key not found: "i do not know"

my_hash.fetch("i do not know", "No, you know") #=> "No, you know"