#
# $File$
# $Author$
# $Date$
# $Revision$
#

require_relative 'lib/rna2prot'

def cnt
  count = Hash.new(0)
  rna_to_prot_map().each_value{|v| count[v]+=1 }
  rest = 10**6
  lambda{|str| count[nil] * str.strip.split("").map{|x| count[x] % rest}.inject(1){|x,y| (x*y) % rest} % rest}
end

count = cnt()
ARGF.each_line do |l|
  puts count.call(l)
end
