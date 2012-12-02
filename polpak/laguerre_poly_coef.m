function c = laguerre_poly_coef ( n )

%*****************************************************************************80
%
%% LAGUERRE_POLY_COEF evaluates the Laguerre polynomial coefficients.
%
%  First terms:
%
%    0: 1
%    1: 1  -1
%    2: 1  -2  1/2
%    3: 1  -3  3/2  1/6
%    4: 1  -4  4   -2/3  1/24
%    5: 1  -5  5   -5/3  5/24  -1/120
%
%  Recursion:
%
%    L(0) = ( 1,  0, 0, ..., 0 )
%    L(1) = ( 1, -1, 0, ..., 0 )
%    L(N) = (2*N-1-X) * L(N-1) - (N-1) * L(N-2) / N
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
%  Parameters:
%
%    Input, integer N, the highest order polynomial to compute.
%    Note that polynomials 0 through N will be computed.
%
%    Output, real C(1:N+1,1:N+1), the coefficients of the Laguerre polynomials 
%    of degree 0 through N.  Each polynomial is stored as a row.
%
  if ( n < 0 )
    c = [];
    return
  end

  c(1:n+1,1:n+1) = 0.0;

  c(1:n+1,1) = 1.0;

  if ( n == 0 )
    return
  end

  c(2,2) = -1.0;
 
  for i = 2 : n

    c(i+1,2:n+1) = ( ...
        ( 2 * i - 1 ) * c(i,  2:n+1) ...
      + (   - i + 1 ) * c(i-1,2:n+1) ...
      -                 c(i  ,1:n) ) / ( i );

  end

  return
end
