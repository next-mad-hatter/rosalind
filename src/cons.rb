#
# $File$
# $Author$
# $Date$
# $Revision$
#

require_relative 'lib/fasta'

profile = Hash.new
read_fasta(ARGF.each_line).values.each do |l|
  l = l.strip
  next if /^>/ =~ l
  l = l.split("").map(&:strip)
  l.each_index do |i|
    c = l[i].upcase
    profile[c] ||= []
    profile[c][i] ||= 0
    profile[c][i] += 1
  end
end
maxlen = profile.max{|x,y| x[1].length <=> y[1].length}[1].length
profile.each_key{|c| profile[c] = profile[c].map{|x| x || 0}.fill(0,profile[c].length..maxlen-1)}

cons = (0..maxlen-1).map{|i| profile.keys.map{|c| [c, profile[c][i]]}.max{|x,y| x[1] <=> y[1]}[0]}
puts cons.join("")

puts profile.to_a.map{|x,y| x + ": " + y.join(" ")}.sort.join("\n")
