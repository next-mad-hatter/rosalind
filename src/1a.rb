#
# $File$
# $Author$
# $Date$
# $Revision$
#

str = ARGF.readline.strip
len = ARGF.readline.strip.to_i

count = Hash.new(0)
(0..str.length-len).each{|i| count[str[i..i+len-1]] += 1}
max = count.values.max
puts count.select{|_,v| v == max}.map(&:first).join(" ")
