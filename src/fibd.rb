#
# $File$
# $Author$
# $Date$
# $Revision$
#

#
# TODO
#

#
# Herein, we compute F_n = F_(n-1) + k*F_(n-2)
#

def fib(k, mem, n)
  return 0 if n < 0
  mem[n] ||= fib(k, mem, n-1) + k*fib(k, mem, n-2)
end

def fibs(k=1,  mem=nil)
  mem ||= [0,1,1]
  lambda{|n| fib(k, mem, n)}
end

f = fibs(3)

m = 3
(1..9).each do |n|
  puts f.call(n)
end
