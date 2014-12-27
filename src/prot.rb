#
# $File$
# $Author$
# $Date$
# $Revision$
#

require_relative 'lib/utils'

ARGF.each_line do |l|
  puts rna_to_prot().call(l)
end

