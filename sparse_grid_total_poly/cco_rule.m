function [ x, w ] = cco_rule ( n )

%*****************************************************************************80
%
%% CCO_RULE computes a Clenshaw Curtis open rule.
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
%    03 February 2011
%
%  Author:
%
%    John Burkardt
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
  x = zeros ( n, 1 );

  x = ( 2 * n - 1: - 2: 1 )';
  x = x / ( 2 * n );
%
%  Chebyshev transformation from [0,1] to [-1,+1].
%
  x = cos ( x * pi );
%
%  Compute the weights.
%
  x_min = -1.0;
  x_max = +1.0;

  w = nc_compute ( n, x_min, x_max, x );

  return
end
