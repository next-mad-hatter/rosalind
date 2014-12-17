#
# $File$
# $Author$
# $Date$
# $Revision$
#

$trans = Hash.new
DATA.each_line do
  |l| l.split.map(&:strip).each_slice(2) do |x|
    $trans[x[0]] = if x[1] == "Stop" then nil else x[1] end if x.length == 2
  end
end

def prot(v)
  def protr(s,v)
    return s if v.empty?
    v[0] = v[0].join("").upcase
    if $trans[v[0]] then protr(s+$trans[v[0]],v[1..-1]) else s end
  end
  protr("",v)
end

ARGF.each_line do |l|
  puts prot(l.strip.split("").each_slice(3).to_a)
end

__END__
UUU F      CUU L      AUU I      GUU V
UUC F      CUC L      AUC I      GUC V
UUA L      CUA L      AUA I      GUA V
UUG L      CUG L      AUG M      GUG V
UCU S      CCU P      ACU T      GCU A
UCC S      CCC P      ACC T      GCC A
UCA S      CCA P      ACA T      GCA A
UCG S      CCG P      ACG T      GCG A
UAU Y      CAU H      AAU N      GAU D
UAC Y      CAC H      AAC N      GAC D
UAA Stop   CAA Q      AAA K      GAA E
UAG Stop   CAG Q      AAG K      GAG E
UGU C      CGU R      AGU S      GGU G
UGC C      CGC R      AGC S      GGC G
UGA Stop   CGA R      AGA R      GGA G
UGG W      CGG R      AGG R      GGG G
