function [ p2, dp2, p1 ] = legendre_recur ( x, n )

%*****************************************************************************80
%
%% LEGENDRE_RECUR finds the value and derivative of a Legendre polynomial.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the point at which polynomials are evaluated.
%
%    Input, integer N, the order of the polynomial to be computed.
%
%    Output, real P2, the value of P(N)(X).
%
%    Output, real DP2, the value of P'(N)(X).
%
%    Output, real P1, the value of P(N-1)(X).
%
  p1 = 1.0;
  dp1 = 0.0;

  p2 = x;
  dp2 = 1.0;

  for i = 2 : n

    p0 = p1;
    dp0 = dp1;

    p1 = p2;
    dp1 = dp2;

    p2 = ( ( 2 * i - 1 ) * x * p1 ...
         + (   - i + 1 )     * p0 ) ...
         / (     i     );

    dp2 = ( ( 2 * i - 1 ) * ( p1 + x * dp1 ) ...
          - (     i - 1 ) * dp0 ) ...
          / (     i     );

  end

  return
end
