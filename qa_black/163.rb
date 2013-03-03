require 'open-uri'

open('http://www.163.com') do |f|
  puts f.read
end