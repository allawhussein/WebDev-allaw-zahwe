file_name = "sample_file_for_file.rb.txt"

file_object = File.open(file_name, "w")#"a" instead to not delete the content
file_object.puts "First line: first output"
file_object.close

#instead of this we can do
File.open(file_name, "a") { |file_object| file_object.puts "text add by 1 line syntax"}

file_object = File.open(file_name, "r")
line = file_object.gets.chomp
puts line
#or we can we use
line = file_object.read
puts line
file_object.close

#now we will download website page and save it to hard dirve
require "open-uri"

url = "https://stackoverflow.com/questions/1727217/file-open-open-and-io-foreach-in-ruby-what-is-the-difference"

html_object = File.open("download.html", "w")
open(url) {|content| html_object.write(content.read)}
html_object.close