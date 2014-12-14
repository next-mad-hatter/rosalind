#
# $File$
# $Author$
# $Date$
# $Revision$
#

require 'gmp'
require 'mathn'
require 'rational'

def gc_ord(x)
  if ["G","C"].include? x then 1 else 0 end
end

def gc_count(s)
  s.split("").inject(0){|x,y| x + gc_ord(y)}
end

if __FILE__ == $0

  hash, key = Hash.new, nil

  ARGF.each_line do |line|
    line.strip!
    if /^>/ =~ line
      key = line[1..-1]
      hash[key] = ""
    else
      hash[key] += line
    end
  end

  hash.each do |k,s|
    hash[k] = ((gc_count(s)/s.length).to_f)
  end
  hash = hash.invert

  puts hash[hash.keys.max]
  puts hash.keys.max*100

end
