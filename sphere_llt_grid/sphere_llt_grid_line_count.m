function line_num = sphere_llt_grid_line_num ( lat_num, long_num )

%*****************************************************************************80
%
%% SPHERE_LLT_GRID_LINE_NUM counts lines for an LLT grid.
%
%  Discussion:
%
%    An LLT grid is a grid of triangles bounded by latitude and longitude 
%    lines over the surface of a sphere in 3D.
%
%    The number returned is the number of pairs of points to be connected.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    29 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer LAT_NUM, LONG_NUM, the number of latitude and
%    longitude lines to draw.  The latitudes do not include the North and South
%    poles, which will be included automatically, so LAT_NUM = 5, for instance,
%    will result in points along 7 lines of latitude.
%
%    Output, integer LINE_NUM, the number of grid lines.
%
  line_num = long_num * ( lat_num + 1 ) ...
           + long_num *   lat_num ...
           + long_num * ( lat_num - 1 );

  return
end
