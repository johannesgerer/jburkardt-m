function cx = laguerre_poly ( n, x )

%*****************************************************************************80
%
%% LAGUERRE_POLY evaluates the Laguerre polynomials at X.
%
%  Differential equation:
%
%    X * Y'' + (1-X) * Y' + N * Y = 0
%
%  First terms:
%
%      1
%     -X    +  1
%   (  X**2 -  4 X     +  2 ) / 2
%   ( -X**3 +  9 X**2 -  18 X    +    6 ) / 6
%   (  X**4 - 16 X**3 +  72 X**2 -   96 X +      24 ) / 24
%   ( -X**5 + 25 X**4 - 200 X**3 +  600 X**2 -  600 x    +  120 ) / 120
%   (  X**6 - 36 X**5 + 450 X**4 - 2400 X**3 + 5400 X**2 - 4320 X + 720 ) / 720
%   ( -X**7 + 49 X**6 - 882 X**5 + 7350 X**4 - 29400 X**3 
%      + 52920 X**2 - 35280 X + 5040 ) / 5040
%
%  Recursion:
%
%    L(0)(X) = 1,
%    L(1)(X) = 1-X,
%    N * L(N)(X) = (2*N-1-X) * L(N-1)(X) - (N-1) * L(N-2)(X)
%
%  Orthogonality:
%
%    Integral ( 0 <= X < Infinity ) exp ( - X ) * L(N)(X) * L(M)(X) dX
%    = 0 if N /= M
%    = 1 if N == M
%
%  Special values:
%
%    L(N)(0) = 1.
%
%  Relations:
%
%    L(N)(X) = (-1)**N / N! * exp ( x ) * (d/dx)**n ( exp ( - x ) * x**n )  
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 July 2004
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
%    Input, real X, the point at which the polynomials are to be evaluated.
%
%    Output, real CX(1:N+1), the Laguerre polynomials of degree 0 through 
%    N evaluated at the point X.
%
  if ( n < 0 )
    cx = [];
    return
  end

  cx(1) = 1.0;

  if ( n == 0 )
    return
  end

  cx(2) = 1.0 - x;
 
  for i = 2 : n

    cx(i+1) = ( ( ( 2 * i - 1 ) - x ) * cx(i  )   ...
                - (     i - 1 )       * cx(i-1) ) ...
                / (     i );

  end

  return
end
