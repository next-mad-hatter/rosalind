#
# $File$
# $Author$
# $Date$
# $Revision$
#

require_relative 'lib/utils'

ARGF.each_line{ |l| puts dna_to_rna(l)}

