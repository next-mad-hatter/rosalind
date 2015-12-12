#
# $File$
# $Author$
# $Date$
# $Revision$
#

require 'mathn'
require 'gmp'
require 'rational'

#data = "1 0 0 1 0 1"
data = "18558 19918 18017 18598 19838 16215"
*x = data.split.map(&:to_i)
puts 2*(x[0] + x[1] + x[2] + 3/4*x[3] + 1/2*x[4]).to_f
