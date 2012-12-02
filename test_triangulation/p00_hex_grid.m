function point = p00_hex_grid ( test, m, h, n )

%*****************************************************************************80
%
%% P00_HEX_GRID returns hex grid points in a region.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TEST, the index of the test problem
%
%    Input, integer M, the spatial dimension.
%
%    Input, real H, the hexagonal spacing.
%
%    Input, integer N, the number of hexagonal grid points
%    that lie within the region, as computed by P00_HEX_GRID_COUNT.
%
%    Output, real POINT(M,N), the hex grid points.
%

%
%  Get the box limits.
%
  [ lo, hi ] = p00_box ( test, m );
%
%  How many hex points will fit in the box?
%
  box(1:2,1) = lo(1:2)';
  box(1:2,2) = hi(1:2)';
  center(1:2) = 0.5 * ( lo(1:2) + hi(1:2) );
  angle = 0.0;

  n2 = hex_grid_angle_size ( box, center, angle, h );
%
%  Generate the hex points.
%
  point2 = hex_grid_angle ( box, center, angle, h, n2 );
%
%  How many of these points are in the region?
%
  inside = p00_inside ( test, m, n2, point2 );
%
%  Copy the good hex grid points.
%
  j = 0;
  for j2 = 1 : n2
    if ( inside(j2) )
      j = j + 1;
      point(1:m,j) = point2(1:m,j2);
    end
  end

  return
end
