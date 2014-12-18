#
# $File$
# $Author$
# $Date$
# $Revision$
#

#
# There's no TCO in ruby :)
#
def merge(m, a, b)
  loop do
    return m + a if b.empty?
    return m + b if a.empty?
    if a[0] < b[0]
      m << a.first
      a.delete_at(0)
    else
      m << b.first
      b.delete_at(0)
    end
  end
end

ARGF.readline
a = ARGF.readline.split.map(&:strip).map(&:to_i)
ARGF.readline
b = ARGF.readline.split.map(&:strip).map(&:to_i)
puts merge([], a, b).join(" ")

