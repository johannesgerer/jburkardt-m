function [ x, y, w ] = legendre_2d_set ( a, b, nx, ny )

%*****************************************************************************80
%
%% LEGENDRE_2D_SET: set a 2D Gauss-Legendre quadrature rule.
%
%  Discussion:
%
%    The integral:
%
%      integral ( a(2) <= y <= b(2) ) ( a(1) <= x <= b(1) ) f(x,y) dx dy
%
%    The quadrature rule:
%
%      sum ( 1 <= i <= n ) w(i) * f ( x(i),y(i) )
%
%    where n = nx * ny, the orders of the rule in the X and Y directions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 May 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A(2), B(2), the lower and upper integration
%    limits.
%
%    Input, integer NX, NY, the orders in the X and Y directions.
%    NX and NY must be between 1 and 10.
%
%    Output, real X(N), Y(N), the abscissas.
%
%    Output, real W(N), the weights.
%

%
%  Get the rules for [-1,+1].
%
  [ xx, wx ] = legendre_set ( nx );
  [ yy, wy ] = legendre_set ( ny );
%
%  Adjust from [-1,+1] to [A,B].
%
  for i = 1 : nx
    xx(i) = ( ( 1.0 - xx(i) ) * a(1)   ...
            + ( 1.0 + xx(i) ) * b(1) ) ...
            /   2.0;
    wx(i) = wx(i) * ( b(1) - a(1) ) / 2.0;
  end

  for j = 1 : ny
    yy(j) = ( ( 1.0 - yy(j) ) * a(2)   ...
            + ( 1.0 + yy(j) ) * b(2) ) ...
            /   2.0;
    wy(j) = wy(j) * ( b(2) - a(2) ) / 2.0;
  end
%
%  Compute the product rule.
%
  n = nx * ny;
  x = zeros ( n, 1 );
  y = zeros ( n, 1 );
  w = zeros ( n, 1 );

  k = 0;
  for j = 1 : ny
    for i = 1 : nx
      k = k + 1;
      x(k) = xx(i);
      y(k) = yy(j);
      w(k) = wx(i) * wy(j);
    end
  end

  return
end

