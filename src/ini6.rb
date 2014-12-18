#
# $File$
# $Author$
# $Date$
# $Revision$
#

ARGF.each_line do |l|
  ct = Hash.new(0)
  l.split.map(&:strip).each{|w| ct[w] += 1}
  puts ct.to_a.map{|x| x.join(" ")}.join("\n")
end
