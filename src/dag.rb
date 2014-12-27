#
# $File$
# $Author$
# $Date$
# $Revision$
#

require 'rgl/topsort'
require_relative 'lib/edge_list'

2.times{ ARGF.readline }
res = []
read_graphs(ARGF.each_line).each do |gr|
  res << if gr.topsort_iterator.length == gr.num_vertices then 1 else -1 end
end
puts res.join(" ")

