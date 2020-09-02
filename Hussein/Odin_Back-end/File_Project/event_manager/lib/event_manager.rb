#the code to be completed on wednesday 1-september-2019
#this day will be the last day in web development
#only night programming is allowed

#the code should display names with corrected zip codes
#before i should know what is a symbol
#tommorow is a iteration 2 part
require "csv"
require 'google/apis/civicinfo_v2'

civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
end

def legislators_by_zipcode(zip)
    civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
    civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'
  
    begin
        legislators = civic_info.representative_info_by_address(
                                        address: zip,
                                        levels: 'country',
                                        roles: ['legislatorUpperBody', 'legislatorLowerBody'])
        legislators = legislators.officials
        legislator_names = legislators.map(&:name)
        legislator_names.join(", ")
    rescue
        "You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials"
    end
end

puts "EventManager Initialized"

template_letter = File.read "form_letter.html"
contents = CSV.open "../event_attendees.csv", headers: true, header_converters: :symbol

contents.each do |row|
    name = row[:first_name]
  
    zipcode = clean_zipcode(row[:zipcode])
  
    legislators = legislators_by_zipcode(zipcode)
  
    personal_letter = template_letter.gsub('FIRST_NAME',name)
    personal_letter.gsub!('LEGISLATORS',legislators)
  
    puts personal_letter
  end