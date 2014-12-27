#
# $File$
# $Author$
# $Date$
# $Revision$
#

require_relative "lib/monomass"

mass = monomass()
ARGF.each_line do |l|
  puts l.strip.split("").map{|x| mass.call(x)}.inject(&:+).to_f
end
