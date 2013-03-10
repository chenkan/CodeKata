=begin
汉语词汇提取
phase       task
1           读入一个文本，进行粗加工（剔除所有非汉字）
2           统计单字节汉字的出现概率（出现次数/文本字符数）
3           统计双字节汉字的出现概率（出现次数/文本字符数）
4           统计双字节汉字的凝聚度，并排序及格式化输出

参考文献
http://www.matrix67.com/blog/archives/5044
<<数学之美>>

提示
使用Hash作为字（词）典
=end

text = File.new("text.txt").read
text = text.unpack("U*").select { |p| (0x4e00..0x9fa5).member? p }.pack("U*")   # TODO Error here
text_arr = text.split ''
#puts text_arr
