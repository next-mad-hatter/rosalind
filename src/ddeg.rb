#
# $File$
# $Author$
# $Date$
# $Revision$
#

require 'rgl/adjacency'

gr = RGL::AdjacencyGraph.new
num = ARGF.readline.split.first.to_i
ARGF.each_line do |l|
  gr.add_edge(*(l.strip.split.map(&:to_i)))
end
puts(
  (1..num).map{|x|
    if gr.has_vertex?(x) then
      gr.adjacent_vertices(x).map{|v| gr.out_degree(v)}.inject(0,&:+)
    else 0 end}.join(" ")
)

