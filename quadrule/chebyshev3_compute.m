function [ x, w ] = chebyshev3_compute ( n )

%*****************************************************************************80
%
%% CHEBYSHEV3_COMPUTE sets up closed Gauss-Chebyshev (first kind) quadrature.
%
%  Discussion:
%
%    The integral:
%
%      Integral ( -1 <= X <= 1 ) F(X) / SQRT ( 1 - X**2 ) dX
%
%    The quadrature rule:
%
%      Sum ( 1 <= I <= N ) W(I) * F ( X(I) )
%
%    If N points are used, then Gauss-Chebyshev quadrature
%    will compute the integral exactly, whenever F(X) is a polynomial
%    of degree 2*N-3 or less.
%
%    The abscissas include -1 and 1.
%
%    If the order is doubled, the abscissas of the new rule include
%    all the points of the old rule.  This fact can be used to
%    efficiently implement error estimation.
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
%  Reference:
%
%    Daniel Zwillinger, editor,
%    Standard Mathematical Tables and Formulae,
%    30th Edition,
%    CRC Press, 1996.
%
%  Parameters:
%
%    Input, int N, the order.
%    N must be at least 2.
%
%    Output, double X(N), the abscissas.
%
%    Output, double W(N), the weights.
%
  if ( n < 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CHEBYSHEV3_COMPUTE - Fatal error!\n' );
    fprintf ( 1, '  N must be at least 2.\n' );
    fprintf ( 1, '  The input value was N = %d\n', n );
    error ( 'CHEBYSHEV3_COMPUTE_SET - Fatal error!' );
  end

  x = zeros ( n, 1 );
  w = zeros ( n, 1 );

  for i = 1 : n

    angle = ( i - 1 ) * pi / ( n - 1 );
    x(i) = cos ( angle );

  end

  w(1)     = pi / ( 2 * ( n - 1 ) );
  w(2:n-1) = pi /       ( n - 1 );
  w(n)     = pi / ( 2 * ( n - 1 ) );

  return
end
