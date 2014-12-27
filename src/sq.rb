#
# $File$
# $Author$
# $Date$
# $Revision$
#

require 'set'
require_relative 'lib/edge_list'

class SparseMatrix

  attr_reader :vals

  def initialize
    @vals = Hash.new(0)
    @cache = Hash.new
  end

  def [](x,y)
    @vals[[x,y].sort]
  end

  def []=(x,y,z)
    if z == @vals.default
      @vals.delete([x,y].sort)
      @cache[x].delete([x,y].sort) if @cache[x]
      @cache[y].delete([x,y].sort) if @cache[y]
    else
      @vals[[x,y].sort] = z
      @cache[x] ||= Set[]
      @cache[x] << [x,y].sort
      @cache[y] ||= Set[]
      @cache[y] << [x,y].sort
    end
  end

  def adj(x)
    @cache[x] || Set[]
  end

  def *(x)
    res = self.class.new
    self.vals.each_key do |i,j|
      (x.adj(i) + x.adj(j)).each do |k, l|
        res[i,l] += self[i,j] * x[k,l] if j == k and i <= l
        res[i,k] += self[i,j] * x[k,l] if j == l and i <= k and k != l
        res[j,l] += self[i,j] * x[k,l] if i == k and j <= l and i != j
        res[j,k] += self[i,j] * x[k,l] if i == l and j <= k and k != l
      end
    end
    res
  end

  def square_diag
    res = self.class.new
    size = @cache.keys.max
    (0..size).each do |i|
      self.adj(i).each{|x| res[i,i] += @vals[x] ** 2}
    end
    res
  end

  def pp
    size = @cache.keys.max
    len = @vals.values.max.to_s.length
    s = ""
    (0..size).each do |i|
      (0..size).each do |j|
        s += " " unless s.empty? or s[-1] == "\n"
        s += self.[](i,j).to_s.rjust(len)
      end
      s += "\n"
    end
    s
  end

end

2.times{ ARGF.readline }
res = []
read_graphs(ARGF.each_line, RGL::AdjacencyGraph).each do |gr|
  mat = SparseMatrix.new
  (0..gr.size-1).each do |i|
    (i+1..gr.size-1).each do |j|
      mat[i,j] = 1 if gr.has_edge?(i+1,j+1)
    end
  end
  mat = (mat * mat).square_diag
  (0..gr.size-1).each do |i|
    mat[i,i] -= gr.out_degree(i+1) * (gr.out_degree(i+1) - 1)
    mat[i,i] -= gr.adjacent_vertices(i+1).map{|v| gr.out_degree(v)}.inject(0,&:+)
  end
  res << if (0..gr.size-1).find{|x| mat[x,x] > 0} then 1 else -1 end
end
puts res.join(" ")

