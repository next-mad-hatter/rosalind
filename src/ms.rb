#
# $File$
# $Author$
# $Date$
# $Revision$
#

ARGF.readline
ARGF.each_line do |l|
  puts l.split.map(&:strip).map(&:to_i).sort.join(" ")
end
