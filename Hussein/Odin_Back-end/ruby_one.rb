#prepatation.rb
require "pry"

a = [1, 2, 3]
a << 4
binding.pry #execution will pause here, allowing you to inspect all objects
puts a