#
# $File$
# $Author$
# $Date$
# $Revision$
#

ARGF.each_line{ |l| puts l.strip.split("").reverse.join("").gsub(/[ATCG]/,{"A" => "T", "T" => "A", "C" => "G", "G" => "C"})}

