#
# $File$
# $Author$
# $Date$
# $Revision$
#

require 'rgl/connected_components'
require_relative 'lib/edge_list'

c = 0
read_graphs(ARGF.each_line, RGL::AdjacencyGraph).each do |gr|
  gr.each_connected_component{|x| c += 1}
end
puts c-1
