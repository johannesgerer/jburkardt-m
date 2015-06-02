function [ x, y, z, w ] = legendre_3d_set ( a, b, nx, ny, nz )

%*****************************************************************************80
%
%% LEGENDRE_3D_SET: set a 3D Gauss-Legendre quadrature rule.
%
%  Discussion:
%
%    The integral:
%
%      integral ( z1 <= z <= z2 )
%               ( y1 <= y <= y2 ) 
%               ( x1 <= x <= x2 ) f(x,y,z) dx dy dz
%
%    The quadrature rule:
%
%      sum ( 1 <= i <= n ) w(i) * f ( x(i),y(i),z(i) )
%
%    where n = nx * ny * nz.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 August 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A(3), B(3), the lower and upper integration
%    limits.
%
%    Input, integer NX, NY, NZ, the orders in the X and Y directions.
%    These orders must be between 1 and 10.
%
%    Output, real X(N), Y(N), Z(N), the abscissas.
%
%    Output, real W(N), the weights.
%

%
%  Get the rules for [-1,+1].
%
  [ xx, wx ] = legendre_set ( nx );
  [ yy, wy ] = legendre_set ( ny );
  [ zz, wz ] = legendre_set ( nz );
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

  for k = 1 : nz
    zz(k) = ( ( 1.0 - zz(k) ) * a(3)   ...
            + ( 1.0 + zz(k) ) * b(3) ) ...
            /   2.0;
    wz(k) = wz(k) * ( b(3) - a(3) ) / 2.0;
  end
%
%  Compute the product rule.
%
  n = nx * ny * nz;

  x = zeros ( n, 1 );
  y = zeros ( n, 1 );
  z = zeros ( n, 1 );
  w = zeros ( n, 1 );

  l = 0;
  for k = 1 : nz
    for j = 1 : ny
      for i = 1 : nx
        l = l + 1;
        x(l) = xx(i);
        y(l) = yy(j);
        z(l) = zz(k);
        w(l) = wx(i) * wy(j) * wz(k);
      end
    end
  end

  return
end

