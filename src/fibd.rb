#
# $File$
# $Author$
# $Date$
# $Revision$
#

def rabbits(mem, m, n)
  return 0 if n < 0
  mem[:rabbits] ||= [0, 1, 1]
  mem[:rabbits][n] ||= rabbits(mem, m, n-1) - newborn(mem, m, n-m) + newborn(mem, m, n)
end

def newborn(mem, m, n)
  return 0 if n < 0
  mem[:newborn] ||= [0, 1, 0]
  mem[:newborn][n] ||= rabbits(mem, m, n-1) - newborn(mem, m, n-1)
end

def fibs(m=3,  mem=Hash.new)
  lambda{|n| rabbits(mem, m, n)}
end

ARGF.readlines.map(&:strip).each do |x|
  # We silently assume m > 1
  n, m = *(x.split.map(&:to_i))
  puts fibs(m).call(n)
end
