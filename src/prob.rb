#!/usr/bin/ruby
#
# $File$
# $Author$
# $Date$
# $Revision$
#

def prob(str, p)
  str.
    split('').
    map(&:downcase).
    map{|x| (if ['c','g'].include? x then p else 1-p end)/2}.
    inject(0){|x,y| x + Math::log(y,10)}
end

STR = ARGF.readline.strip
PROB = ARGF.readline.split.map(&:strip).map(&:to_r)

puts PROB.map{|x| prob(STR, x)}.join(" ")

#puts STR
#puts PROB.join(" ")

