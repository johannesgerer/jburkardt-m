function [ o, c, f ] = hep_coefficients ( n )

%*****************************************************************************80
%
%% HEP_COEFFICIENTS: coefficients of He(i,x).
%
%  Discussion:
%
%    He(i,x) represents the probabilist's Hermite polynomial.
%
%  First terms:
%
%    N/K     0     1      2      3       4     5      6    7      8    9   10
%
%     0      1
%     1      0     1
%     2     -1     0      1
%     3      0    -3      0      1
%     4      3     0     -6      0       1
%     5      0    15      0    -10       0     1
%     6    -15     0     45      0     -15     0      1
%     7      0  -105      0    105       0   -21      0     1
%     8    105     0   -420      0     210     0    -28     0      1
%     9      0   945      0  -1260       0   378      0   -36      0   1
%    10   -945     0   4725      0   -3150     0    630     0    -45   0    1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 September 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Milton Abramowitz Irene Stegun,
%    Handbook of Mathematical Functions,
%    US Department of Commerce, 1964.
%
%    Daniel Zwillinger, editor,
%    CRC Standard Mathematical Tables and Formulae,
%    30th Edition,
%    CRC Press, 1996.
%
%  Parameters:
%
%    Input, integer N, the degree of the polynomial.
%
%    Output, integer O, the number of coefficients.
%
%    Output, real C(1:O,1), the coefficients of the Hermite polynomial
%    of degree N.
%
%    Output, integer F(1:O,1), the exponents.
%

%
%  Compute the table.
%
  ct(1:n+1,1:n+1) = 0.0;

  ct(1,1) = 1.0;

  if ( 0 < n )
    ct(2,2) = 1.0;
  end

  for i = 2 : n
    ct(i+1,1)     =               - ( i - 1 ) * ct(i-1,1);
    ct(i+1,2:i-1) = ct(i  ,1:i-2) - ( i - 1 ) * ct(i-1,2:i-1);
    ct(i+1,  i  ) = ct(i  ,  i-1);
    ct(i+1,  i+1) = ct(i  ,  i  );
  end
%
%  Extract the nonzero data from the alternating columns of the last row.
%
  o = floor ( ( n + 2 ) / 2 );

  c = zeros ( o, 1 );
  f = zeros ( o, 1 ); 

  k = o;
  for j = n + 1 : -2 : 1
    c(k) = ct(n+1,j);
    f(k) = j - 1;
    k = k - 1;
  end

  return
end
