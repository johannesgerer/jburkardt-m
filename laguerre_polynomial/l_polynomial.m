function v = l_polynomial ( m, n, x )

%*****************************************************************************80
%
%% L_POLYNOMIAL evaluates the Laguerre polynomial L(n,x).
%
%  First terms:
%
%      1
%     -X     +  1
%   (  X^2 -  4 X      +  2 ) / 2
%   ( -X^3 +  9 X^2 -  18 X    +    6 ) / 6
%   (  X^4 - 16 X^3 +  72 X^2 -   96 X +      24 ) / 24
%   ( -X^5 + 25 X^4 - 200 X^3 +  600 X^2 -   600 X    +  120 ) / 120
%   (  X^6 - 36 X^5 + 450 X^4 - 2400 X^3 +  5400 X^2 -  4320 X     + 720 ) 
%     / 720
%   ( -X^7 + 49 X^6 - 882 X^5 + 7350 X^4 - 29400 X^3 + 52920 X^2 - 35280 X 
%     + 5040 ) / 5040
%
%  Recursion:
%
%    L(0,X) = 1
%    L(1,X) = 1 - X
%    L(N,X) = (2*N-1-X)/N * L(N-1,X) - (N-1)/N * L(N-2,X)
%
%  Orthogonality:
%
%    Integral ( 0 <= X < oo ) exp ( - X ) * L(N,X) * L(M,X) dX = delta ( M, N )
%
%  Relations:
%
%    L(N,X) = (-1)^N / N! * exp ( x ) * (d/dx)^n ( exp ( - x ) * x^n )  
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    09 March 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Milton Abramowitz, Irene Stegun,
%    Handbook of Mathematical Functions,
%    National Bureau of Standards, 1964,
%    ISBN: 0-486-61272-4,
%    LC: QA47.A34.
%
%  Parameters:
%
%    Input, integer M, the number of evaluation points.
%
%    Input, integer N, the highest order polynomial to compute.
%    Note that polynomials 0 through N will be computed.
%
%    Input, real X(M,1), the evaluation points.
%
%    Output, real V(M,1:N+1), the function values.
%
  if ( n < 0 ) then
    return
  end

  v = zeros ( m, n + 1 );

  v(1:m,1) = 1.0;

  if ( n == 0 )
    return
  end

  v(1:m,2) = 1.0 - x(1:m);
 
  for j = 2 : n

    v(1:m,j+1) = ( ( ( 2 * j - 1 ) - x(1:m,1) ) .* v(1:m,j)   ...
                 +   (   - j + 1 )               * v(1:m,j-1) ) ...
                 /         j;

  end

  return
end
