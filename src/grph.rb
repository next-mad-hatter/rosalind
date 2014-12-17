#
# $File$
# $Author$
# $Date$
# $Revision$
#

require_relative 'lib/fasta'
require 'rgl/adjacency'

strs = read_fasta(ARGF.each_line)

def overlap_graph(strs, k=3)
  dg=RGL::DirectedAdjacencyGraph.new
  strs.keys.product(strs.keys).each do |x,y|
    if strs[x] != strs[y] and strs[x][-k..-1] == strs[y][0..k-1] and strs[x].length >= k and strs[y].length >= k
      dg.add_edge x,y
    end
  end
  dg
end

dg = overlap_graph(strs)
puts dg.edges.map(&:to_a).map{|x| x.join(" ")}.join("\n")
