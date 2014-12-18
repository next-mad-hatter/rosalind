#
# $File$
# $Author$
# $Date$
# $Revision$
#

def ins(ns)

  def inr(ss, ns, ct)
    return ct if ns.empty?
    i = ss.length
    ss << ns[0]
    ns = ns[1..-1]
    while i > 0 and ss[i] < ss[i-1]
      ss[i], ss[i-1] = ss[i-1], ss[i]
      ct += 1
      i -= 1
    end
    inr(ss, ns, ct)
  end

  inr([], ns, 0)
end

ARGF.readline
ARGF.each_line do |l|
  puts ins(l.split.map(&:strip).map(&:to_i)).to_s
end
