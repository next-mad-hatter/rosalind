#
# $File$
# $Author$
# $Date$
# $Revision$
#

str = ARGF.readline
ARGF.each_line do |l|
  l = l.split.map(&:strip).map(&:to_i)
  puts l.each_slice(2).to_a.map{|x| str[x.first..x.last]}.join(" ")
end
