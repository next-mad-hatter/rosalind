#
# $File$
# $Author$
# $Date$
# $Revision$
#

def find_2sum(ns)
  neg, pos = ns.each_with_index.to_a.map{|x| [x.first, x.last+1]}.partition{|x| x.first < 0}
  neg.map!{|x| [x.first.abs, x.last]}
  neg.sort!{|a,b| a.first <=> b.first}
  pos.sort!{|a,b| a.first <=> b.first}
  #puts neg.inspect
  #puts pos.inspect
  while !neg.empty? and !pos.empty?
    if neg.first.first == pos.first.first
      return [neg.first.last, pos.first.last].sort
    elsif neg.first.first > pos.first.first
      pos.delete_at(0)
    else
      neg.delete_at(0)
    end
  end
  return [-1]
end

ARGF.readline
ARGF.each_line do |l|
  puts find_2sum(l.split.map(&:strip).map(&:to_i)).join(" ")
end
