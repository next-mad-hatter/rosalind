#
# $File$
# $Author$
# $Date$
# $Revision$
#

require 'rgl/base'
require 'rgl/adjacency'

def read_graph(lines, kind=RGL::DirectedAdjacencyGraph)
  gr = kind.new
  size = nil
  lines.each do |str|
    unless size
      size = str.split.first.to_i
      next
    end
    gr.add_edge(*(str.strip.split.map(&:to_i)))
  end
  (1..size).each{|x| gr.add_vertex(x) unless gr.has_vertex?(x)}
  gr
end

def read_graphs(lines, kind=RGL::DirectedAdjacencyGraph)
  res = []
  buf = []
  lines.each do |str|
    if str.strip.empty?
      res << read_graph(buf, kind) unless buf.empty?
      buf = []
    else
      buf << str.strip
    end
  end
  res << read_graph(buf, kind) unless buf.empty?
  res
end

