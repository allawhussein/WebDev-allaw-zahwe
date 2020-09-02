#the code to be completed on wednesday 1-september-2019
#this day will be the last day in web development
#only night programming is allowed

#the code should display names with corrected zip codes
#before i should know what is a symbol
#tommorow is a iteration 2 part
require "csv"
puts "EventManager Initialized"

content = CSV.open "../event_attendees.csv", headers: true
for row in content
    name = row[2]
    puts name
end