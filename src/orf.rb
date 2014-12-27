#
# $File$
# $Author$
# $Date$
# $Revision$
#

require_relative 'lib/fasta'
require_relative 'lib/utils'

read_fasta(ARGF.each_line).values.each do |l|
  strs = [
    l,
    l[1..-1],
    l[2..-1],
    revc(l),
    revc(l)[1..-1],
    revc(l)[2..-1]
  ]
  #.map{|x| rna_to_prot().call(x)}
  puts strs.join("\n")
end
