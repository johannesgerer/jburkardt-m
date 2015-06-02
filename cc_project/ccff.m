function [ x, w ] = ccff ( n )

%*****************************************************************************80
%
%% CCFF computes a Clenshaw Curtis quadrature rule for [-1,+1] omitting the ends.
%
%  Discussion:
%
%    Our convention is that the abscissas are numbered from left to right.
%
%    The rule is defined on [-1,1].
%
%    The integral to approximate:
%
%      Integral ( -1 <= X <= 1 ) F(X) dX
%
%    The quadrature rule:
%
%      Sum ( 1 <= I <= N ) W(I) * F ( X(I) )
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
%    Input, integer N, the order of the rule.
%    1 <= N.
%
%    Output, real X(N), the abscissas.
%
%    Output, real W(N), the weights.
%
  t = pi * ( 1 : n ) / ( n + 1 );
  t = t ( : );
  x = cos ( t );

  w = zeros ( n, 1 );
  for i = 1 : n
    for j = 1 : n
      w(i) = w(i) + sin ( j * t(i) ) * ( 1.0 - cos ( j * pi ) ) / j;
    end
  end
  w = 2.0 * sin ( t ) .* w / ( n + 1 );

  return
end

