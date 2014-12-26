#
# $File$
# $Author$
# $Date$
# $Revision$
#

ARGF.each_line do |l|
  p = (1..l.strip.to_i).to_a.permutation.to_a
  puts p.length
  puts p.map{|x| x.join(" ")}.join("\n")
end
