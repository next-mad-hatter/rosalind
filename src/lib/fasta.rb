#
# $File$
# $Author$
# $Date$
# $Revision$
#

class InvalidFasta < Exception
end

##
# Common use case: read_fasta(ARGF.each_line)
#
def read_fasta(lines)
  res, key = Hash.new, nil
  lines.each do |line|
    line.strip!
    if /^>/ =~ line
      key = line[1..-1]
      res[key] = ""
    else
      raise InvalidFasta unless key
      res[key] += line
    end
  end
  res
end
