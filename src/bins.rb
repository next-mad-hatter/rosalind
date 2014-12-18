#
# $File$
# $Author$
# $Date$
# $Revision$
#

def bins(ns, m)
  return -1 if ns.empty?
  n = ns.length.div 2
  if ns[n] == m then n+1
  elsif ns[n] > m
    if n == 0 then -1 else bins(ns[0..n-1], m) end
  else
    r = bins(ns[n+1..-1], m)
    if r == -1 then -1 else n+r+1 end
  end
end

ARGF.readline
ARGF.readline
ns = ARGF.readline.strip.split.map(&:to_i)
ARGF.each_line do |l|
  puts l.strip.split.map(&:to_i).map{|m| bins(ns, m)}.join(" ")
end
