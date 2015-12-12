#
# $File$
# $Author$
# $Date$
# $Revision$
#

require 'mathn'
require 'gmp'
require 'rational'

def prb(k,m,n)
  t = k+m+n

#  x_AA = k/t
#  x_Aa = m/t
#  x_aa = n/t
#  y_AA = (k-1)/(t-1) + k/(t-1)
#  y_Aa = (m-1)/(t-1) + m/(t-1)
#  y_aa = (n-1)/(t-1) + n/(t-1)


# 1 - {
#              P(X = aa) * P(Y = aa | X = aa) +
#        1/4 * P(X = Aa) * P(Y = Aa | X = Aa) +
#        1/2 * P(X = Aa) * P(Y = aa | X = Aa) +
#        1/2 * P(X = aa) * P(Y = Aa | X = aa) +
#     }
  1 - (        n/t * (n-1)/(t-1) +
         1/4 * m/t * (m-1)/(t-1) +
         1/2 * m/t * n/(t-1) +
         1/2 * n/t * m/(t-1)
      )
end

#k=m=n=2
k, m, n = 21, 29, 25
puts prb(k,m,n).to_f

