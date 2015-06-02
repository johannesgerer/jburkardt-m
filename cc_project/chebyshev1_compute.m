function [ x, w ] = chebyshev1_compute ( n )

%*****************************************************************************80
%
%% CHEBYSHEV1_COMPUTE computes a Gauss-Chebyshev type 1 quadrature rule.
%
%  Discussion:
%
%    The integral:
%
%      Integral ( -1 <= X <= 1 ) F(X) / sqrt ( 1 - x^2 ) dX
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
%    13 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Philip Davis, Philip Rabinowitz,
%    Methods of Numerical Integration,
%    Second Edition,
%    Dover, 2007,
%    ISBN: 0486453391,
%    LC: QA299.3.D28.
%
%  Parameters:
%
%    Input, integer N, the order.
%    N must be greater than 0.
%
%    Output, real XN), the abscissas.
%
%    Output, real W(N), the weights.
%
  if ( n < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CHEBYSHEV1_COMPUTE - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of N = %d\n', n );
    error ( 'CHEBYSHEV1_COMPUTE - Fatal error!' );
  end

  x = zeros ( n, 1 );
  w = zeros ( n, 1 );

  w(1:n) = pi / n;

  for i = 1 : n
    x(i) = cos ( pi * ( 2 * n + 1 - 2 * i ) / ( 2 * n ) );
  end

  return
end
