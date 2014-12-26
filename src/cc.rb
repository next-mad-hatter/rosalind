#
# $File$
# $Author$
# $Date$
# $Revision$
#

require 'rgl/adjacency'
require 'rgl/connected_components'

gr = RGL::AdjacencyGraph.new
num = ARGF.readline.split.first.to_i
ARGF.each_line do |l|
  gr.add_edge(*(l.strip.split.map(&:to_i)))
end
(1..num).each{|x| gr.add_vertex(x)}
n = 0
gr.each_connected_component{ n += 1 }
puts n

