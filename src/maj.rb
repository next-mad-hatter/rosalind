#
# $File$
# $Author$
# $Date$
# $Revision$
#

def maj(ns)
  ct = Hash.new(0)
  ns.each{|x| ct[x] += 1}
  m = ct.find{|x,y| y > ns.length/2.0}
  if m then m[0] else -1 end
end

ARGF.readline
puts ARGF.readlines.map{|l| maj(l.split.map(&:strip).map(&:to_i))}.join(" ")
