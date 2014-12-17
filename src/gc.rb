#
# $File$
# $Author$
# $Date$
# $Revision$
#

require 'gmp'
require 'mathn'
require 'rational'

require_relative 'lib/fasta'

def gc_ord(x)
  if ["G","C"].include? x then 1 else 0 end
end

def gc_count(s)
  s.split("").inject(0){|x,y| x + gc_ord(y)}
end

if __FILE__ == $0

  hash = read_fasta(ARGF.each_line)
  hash.each do |k,s|
    hash[k] = ((gc_count(s)/s.length).to_f)
  end
  hash = hash.invert

  puts hash[hash.keys.max]
  puts hash.keys.max*100

end
