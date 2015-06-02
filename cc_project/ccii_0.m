function [ x, w ] = ccii_0 ( n, ell )

%*****************************************************************************80
%
%% CCII_0 returns a Clenshaw-Curtis type rule for integration over [0,+oo).
%
%  Discussion:
%
%    The integral I(f) is of Hermite type, with density exp(-x^2):
%      I(f) = integral ( -oo < x < +oo ) f(x) exp(-x^2) dx
%    and the quadrature rule which approximates I(f) is
%      Q(f) = sum ( 1 <= i <= n ) w(i) * f(x(i))
%
%    The parameter ELL controls the mapping between [-1,+1] and (-oo,+oo),
%    and can be initially chosen to be 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    19 May 2014
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
  t = ( ( 1 : n ) * pi / ( n + 1 ) )';
  x = ell * cot ( t );

  w = ell * pi ./ ( sin ( t ) ) .^2 / ( n + 1 );
  w(1) = w(1) / 2.0;
  w(n) = w(n) / 2.0;
%
%  Build in the density.
%
  w = exp ( - x.^2 ) .* w;

  return
end
