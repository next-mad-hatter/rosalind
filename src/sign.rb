#
# $File$
# $Author$
# $Date$
# $Revision$
#

N = 4

p = (1..N).to_a.permutation(N).to_a.
  product([-1,1].repeated_permutation(N).to_a)
puts p.length

puts p.map{|x| x.transpose.map{|a| a[0]*a[1]}}.map{|e| e.join(" ")}.join("\n")

