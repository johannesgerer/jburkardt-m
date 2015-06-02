function ng = polygon_grid_count ( n, nv )

%*****************************************************************************80
%
%% POLYGON_GRID_COUNT counts the grid points inside a polygon.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of subintervals on a side.
%
%    Input, integer NV, the number of vertices.
%    3 <= NV.
%
%    Output, integer NG, the number of grid points.
%
  ng = 1 + nv * ( n * ( n + 1 ) ) / 2;

  return
end
