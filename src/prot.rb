#
# $File$
# $Author$
# $Date$
# $Revision$
#

require_relative 'lib/rna2prot'

ARGF.each_line do |l|
  puts rna_to_prot().call(l)
end

