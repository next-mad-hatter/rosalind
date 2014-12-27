#
# $File$
# $Author$
# $Date$
# $Revision$
#

def dna_to_rna(str)
  str.strip.gsub(/T/,"U")
end

def revc(str)
  str.strip.reverse.gsub(/[ATCG]/,{"A" => "T", "T" => "A", "C" => "G", "G" => "C"})
end

def rna_to_prot_map
  trans = Hash.new
<<EOF
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
EOF
  .each_line do
    |l| l.split.map(&:strip).each_slice(2) do |x|
      trans[x[0]] = if x[1] == "Stop" then nil else x[1] end if x.length == 2
    end
  end
  trans
end

def rna_to_prot(trans=rna_to_prot_map())
  def protr(v,trans)
    s = ""
    while not v.empty? do
      v[0] = v[0].join("").upcase
      return s unless trans[v[0]]
      s += trans[v[0]]
      v.delete_at 0
    end
    s
  end
  lambda{|v| protr(v.strip.split("").each_slice(3).to_a,trans)}
end

