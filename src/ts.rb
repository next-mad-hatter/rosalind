#
# $File$
# $Author$
# $Date$
# $Revision$
#

require 'rgl/topsort'
require_relative 'lib/edge_list'

gr = read_graph(ARGF.each_line)
puts gr.topsort_iterator.to_a.join(" ")

