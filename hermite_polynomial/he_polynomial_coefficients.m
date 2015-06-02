function c = he_polynomial_coefficients ( n )

%*****************************************************************************80
%
%% HE_POLYNOMIAL_COEFFICIENTS: coefficients of He(i,x).
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
%    07 March 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Milton Abramowitz and Irene Stegun,
%    Handbook of Mathematical Functions,
%    US Department of Commerce, 1964.
%
%  Parameters:
%
%    Input, integer N, the highest order polynomial to compute.
%    Note that polynomials 0 through N will be computed.
%
%    Output, real C(1:N+1,1:N+1), the coefficients of the Hermite polynomials.
%
  if ( n < 0 )
    c = [];
    return
  end

  c(1:n+1,1:n+1) = 0.0;

  c(1,1) = 1.0;

  if ( n == 0 )
    return
  end

  c(2,2) = 1.0;
 
  for i = 2 : n
    c(i+1,1)     =                             - ( i - 1 ) * c(i-1,1);
    c(i+1,2:i-1) =                c(i  ,1:i-2) - ( i - 1 ) * c(i-1,2:i-1);
    c(i+1,  i  ) =                c(i  ,  i-1);
    c(i+1,  i+1) =                c(i  ,  i  );
  end

  return
end
