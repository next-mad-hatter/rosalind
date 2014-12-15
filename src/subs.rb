#
# $File$
# $Author$
# $Date$
# $Revision$
#

def subs(str, x)
  res = []
  while p = str.index(x, p || 0) do
    p += 1
    res << p
  end
  res
end

ARGF.readlines.map(&:strip).each_slice(2) do |x|
  puts subs(*x).join(" ") unless x.length < 2
end
