require 'open-uri'
require 'iconv'

conv = Iconv.new("UTF-8", "GBK")
open('http://www.163.com') do |f|
  content = conv.iconv f.read
  domains = content.scan(/\/\/(.{1,25}.163.com)/).uniq!.sort!    #TODO 正则表达式可以再优化
  domains.each_index {|x| puts "#{x} - #{domains[x][0]}"}
end