#
# $File$
# $Author$
# $Date$
# $Revision$
#

require_relative 'lib/fasta'
require 'net/http'

def get_follow_redirects(uri, request_max = 5)
  raise "Max number of redirects reached" if request_max <= 0
  response = Net::HTTP.get_response(uri)
  case response.code.to_i
  when 200
    response.body
  when 301..303
    get_follow_redirects(URI(response['location']), request_max - 1)
  else
    response.code
  end
end

exp = /N[^P]{1}[ST][^P]{1}/

ARGF.each_line do |l|
  fasta = get_follow_redirects(URI("http://www.uniprot.org/uniprot/" + l.strip + ".fasta"))
  prot = read_fasta fasta.lines
  throw "WTF" if prot.size != 1
  str = prot.values.first
  res = []
  loop do
    i = exp =~ str
    break unless i
    res << (res.last || 0) + i + 1
    str = str[i+1..-1]
  end
  next if res.empty?
  puts l.strip
  puts res.join(" ")
end
