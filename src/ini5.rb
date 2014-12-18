#
# $File$
# $Author$
# $Date$
# $Revision$
#

c = 0
ARGF.each_line do |l|
  puts l if c.odd?
  c += 1
end
