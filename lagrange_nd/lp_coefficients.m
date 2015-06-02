function [ o, c, f ] = lp_coefficients ( n )

%*****************************************************************************80
%
%% LP_COEFFICIENTS: coefficients of Legendre polynomials P(n,x).
%
%  Discussion:
%
%    The Legendre polynomial with index N will have O = 1 + (N/2) terms.
%    The monomials of orders N, N-2, N-2, ... will have nonzero coefficients.
%
%  First terms:
%
%     1
%     0     1
%    -1/2   0      3/2
%     0    -3/2    0     5/2
%     3/8   0    -30/8   0     35/8
%     0    15/8    0   -70/8    0     63/8
%    -5/16  0    105/16  0   -315/16   0    231/16
%     0   -35/16   0   315/16   0   -693/16   0    429/16
%
%     1.00000
%     0.00000  1.00000
%    -0.50000  0.00000  1.50000
%     0.00000 -1.50000  0.00000  2.5000
%     0.37500  0.00000 -3.75000  0.00000  4.37500
%     0.00000  1.87500  0.00000 -8.75000  0.00000  7.87500
%    -0.31250  0.00000  6.56250  0.00000 -19.6875  0.00000  14.4375
%     0.00000 -2.1875   0.00000  19.6875  0.00000 -43.3215  0.00000  26.8125
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
%    Output, real C(1:O,1), the coefficients of the Legendre polynomial
%    of degree N.
%
%    Output, integer F(1:O,1), the exponents.
%

%
%  Compute the table.
%
  ctable(1:n+1,1:n+1) = 0.0;

  ctable(1,1) = 1.0;

  if ( 1 <= n)

    ctable(2,2) = 1.0;
 
    for i = 2 : n
      ctable(i+1,1:i-1) =                     (   - i + 1 ) * ctable(i-1,1:i-1) / i;
      ctable(i+1,2:i+1) = ctable(i+1,2:i+1) + ( i + i - 1 ) * ctable(i  ,1:i  ) / i;
    end
 
  end
%
%  Extract the nonzero data from the alternating columns of the last row.
%
  o = floor ( ( n + 2 ) / 2 );

  c = zeros ( o, 1 );
  f = zeros ( o, 1 ); 

  k = o;
  for j = n + 1 : -2 : 1
    c(k) = ctable(n+1,j);
    f(k) = j - 1;
    k = k - 1;
  end

  return
end
