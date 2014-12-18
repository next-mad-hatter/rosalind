#
# $File$
# $Author$
# $Date$
# $Revision$
#

def find_2sum(ns)
  r = ns.index(0)
  if r and (r < ns.length-1)
    q = ns[r+1..-1].index(0)
    if q and r
      return [r+1, r+q+2]
    end
  end
  neg, pos = ns.each_with_index.to_a.map{|x| [x.first, x.last+1]}.partition{|x| x.first < 0}
  neg.map!{|x| [x.first.abs, x.last]}
  neg.sort!{|a,b| a.first <=> b.first}
  pos.sort!{|a,b| a.first <=> b.first}
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
  l = l.split.map(&:strip).map(&:to_i)
  x = find_2sum(l)
  if x != [-1] and l[x.first-1] != -1*l[x.last-1]
    puts ["ERROR:", l[x.first-1], l[x.last-1]].join(" ")
  end
  puts x.join(" ")
end
