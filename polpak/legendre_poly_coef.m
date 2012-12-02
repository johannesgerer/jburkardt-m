function c = legendre_poly_coef ( n )

%*****************************************************************************80
%
%% LEGENDRE_POLY_COEF evaluates the Legendre polynomial coefficients.
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
%    28 July 2004
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
%    Daniel Zwillinger, editor,
%    CRC Standard Mathematical Tables and Formulae,
%    30th Edition,
%    CRC Press, 1996.
%
%  Parameters:
%
%    Input, integer N, the highest order polynomial to evaluate.
%    Note that polynomials 0 through N will be evaluated.
%
%    Output, real C(1:N+1,1:N+1), the coefficients of the Legendre polynomials 
%    of degree 0 through N.  Each polynomial is stored as a row.
%
  if ( n < 0 )
    c = [];
    return
  end

  c(1:n+1,1:n+1) = 0.0;

  c(1,1) = 1.0;

  if ( n <= 0 )
    return
  end

  c(2,2) = 1.0;
 
  for i = 2 : n
    c(i+1,1:i-1) =                (   - i + 1 ) * c(i-1,1:i-1) / ( i );
    c(i+1,2:i+1) = c(i+1,2:i+1) + ( i + i - 1 ) * c(i  ,1:i  ) / ( i );
  end
 
  return
end
