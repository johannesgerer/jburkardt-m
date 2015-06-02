function value = euler_poly ( n, x )

%*****************************************************************************80
%
%% EULER_POLY evaluates the N-th Euler polynomial at X.
%
%  First values:
%
%    E(0,X) = 1
%    E(1,X) = X   - 1/2
%    E(2,X) = X^2 -     X
%    E(3,X) = X^3 - 3/2 X^2 + 1/4
%    E(4,X) = X^4 - 2 * X^3 +      X
%    E(5,X) = X^5 - 5/2 X^4 + 5/2  X^2 - 1/2
%    E(6,X) = X^6 - 3   X^5 + 5    X^3 - 3    X
%    E(7,X) = X^7 - 7/2 X^6 + 35/4 X^4 - 21/2 X^2 + 17/8
%    E(8,X) = X^8 - 4   X^7 + 14   X^5 - 28   X^3 + 17    X
%
%  Special values:
%
%    E'(N,X) = N * E(N-1,X)
%
%    E(N,1/2) = E(N) / 2^N, where E(N) is the N-th Euler number.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the Euler polynomial to
%    be evaluated.  N must be 0 or greater.
%
%    Input, real X, the value at which the polynomial is to
%    be evaluated.
%
%    Output, real VALUE, the value of E(N,X).
%
  bx1 = bernoulli_poly2 ( n+1, x );
  bx2 = bernoulli_poly2 ( n+1, 0.5 * x );

  value = 2.0  * ( bx1 - bx2 * 2.0^( n + 1 ) ) / ( n + 1 );

  return
end
