function [ x, w ] = chebyshev3_compute ( n )

%*****************************************************************************80
%
%% CHEBYSHEV3_COMPUTE computes a closed Gauss-Chebyshev (first kind) quadrature.
%
%  Discussion:
%
%    The integral:
%
%      Integral ( -1 <= X <= 1 ) F(X) / sqrt ( 1 - X^2 ) dX
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
%
%    Output, double X(N), the abscissas.
%
%    Output, double W(N), the weights.
%
  x = zeros ( n, 1 );
  w = zeros ( n, 1 );

  if ( n == 1 )

    x(1) = 0.0;
    w(1) = pi;

  else

    for i = 1 : n
      angle = ( i - 1 ) * pi / ( n - 1 );
      x(i) = cos ( angle );
    end

    w(1)     = pi / ( 2 * ( n - 1 ) );
    w(2:n-1) = pi /       ( n - 1 );
    w(n)     = pi / ( 2 * ( n - 1 ) );

  end

  return
end
