require 'set'

input = ARGF.readlines

n = input[0].strip.to_i
x = input[1].gsub(/\{|\}/, "").strip.split(',').map(&:strip).map(&:to_i)
y = input[2].gsub(/\{|\}/, "").strip.split(',').map(&:strip).map(&:to_i)

z = Set.new(1..n)
x = Set.new(x)
y = Set.new(y)

[
  x.union(y),
  x.intersection(y),
  x - y,
  y - x,
  z - x,
  z - y
].each do |set|
  puts "{ " + set.to_a.join(', ') + " }"
end
