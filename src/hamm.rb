#
# $File$
# $Author$
# $Date$
# $Revision$
#

def hamm(x, y)
  x, y = *([x,y].map{|z| z.split("")})
  x.zip(y).inject(0){|z,s| z += if s[0] == s[1] then 0 else 1 end}
end

ARGF.readlines.map(&:strip).each_slice(2) do |x|
  puts hamm(*x) unless x.length < 2
end
