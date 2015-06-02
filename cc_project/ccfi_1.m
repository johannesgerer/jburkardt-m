function [ x, w ] = ccfi_1 ( n, ell )

%*****************************************************************************80
%
%% CCFI_1 returns a Boyd quadrature rule for the Laguerre integral.
%
%  Discussion:
%
%    The Laguerre integral I(f) is:
%      I(f) = integral ( 0 <= x < +oo ) f(x) dx
%    and the quadrature rule which approximates I(f) is
%      Q(f) = sum ( 1 <= i <= n ) w(i) * f(x(i))
%
%    The parameter ELL controls the mapping between [-1,+1] and [0,+oo),
%    and can be initially chosen to be 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    14 May 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    John Boyd,
%    Exponentially convergent Fourier-Chebyshev quadrature schemes on
%    bounded and infinite intervals,
%    Journal of Scientific Computing,
%    Volume 2, Number 2, 1987, pages 99-109.
%
%  Parameters:
%
%    Input, integer N, the number of points to use in the rule.
%
%    Input, real ELL, the mapping parameter.
%
%    Output, real X(N), W(N), the points and weights for the quadrature rule.
%
  t = ( pi * ( 1 : n ) / ( n + 1 ) )';
  x = ell * ( cot ( 0.5 * t ) ) .^ 2;

  w = zeros ( n, 1 );
  for i = 1 : n
    for j = 1 : n
      w(i) = w(i) + sin ( j * t(i) ) * ( 1.0 - cos ( j * pi ) ) / j;
    end
  end
  w = w * 2.0 * ell .* sin ( t ) ./ ( 1.0 - cos ( t ) ) .^ 2 * 2.0 / ( n + 1 );

  return
end
