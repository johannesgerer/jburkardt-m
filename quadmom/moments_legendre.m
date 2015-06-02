function w = moments_legendre ( m, a, b )

%*****************************************************************************80
%
%% MOMENTS_LEGENDRE returns moments of the Legendre weight on [A,B].
%
%  Discussion:
%
%    mu(k) = integral ( a <= x <= b ) x^k dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 September 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of moments desired.
%
%    Input, real A, B, the left and right endpoints of the interval.
%
%    Output, real W(M), the weighted integrals of X^0 through X^(M-1).
%
  w = zeros ( m, 1 );

  bk = 1.0;
  ak = 1.0;
  for k = 1 : m
    bk = bk * b;
    ak = ak * a;
    w(k) = ( bk - ak ) / double ( k );
  end

  return
end

