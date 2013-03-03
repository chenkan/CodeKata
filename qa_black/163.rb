require 'open-uri'
require 'iconv'

conv = Iconv.new("UTF-8", "GBK")
open('http://www.163.com') do |f|
  content = conv.iconv f.read
  puts content
end