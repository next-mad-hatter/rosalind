#
# $File$
# $Author$
# $Date$
# $Revision$
#

class Integer
  def choose(k)
    pTop = (self-k+1 .. self).inject(1, &:*) 
    pBottom = (2 .. k).inject(1, &:*)
    pTop / pBottom
  end

  def fact
    (1..self).inject(&:*)
  end

end

ARGF.each_line do |l|
  n, k = l.strip.split.map(&:to_i)
  puts( (n.choose(k) * k.fact) % 10**6 )
end

