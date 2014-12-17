#
# $File$
# $Author$
# $Date$
# $Revision$
#

require_relative "lib/monomass"

ARGF.each_line do |l|
  puts l.strip.split("").map{|x| monomass(x)}.inject(&:+).to_f
end
