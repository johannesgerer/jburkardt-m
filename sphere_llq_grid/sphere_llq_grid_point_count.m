function point_num = sphere_llq_grid_point_count ( lat_num, long_num )

%*****************************************************************************80
%
%% SPHERE_LLQ_GRID_POINT_COUNT counts points for a SPHERE LLQ grid.
%
%  Discussion:
%
%    A SPHERE LLQ grid imposes a grid of quadrilaterals on a sphere,
%    using latitude and longitude lines.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    28 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer LAT_NUM, LONG_NUM, the number of latitude 
%    and longitude lines to draw.  The latitudes do not include the North and 
%    South poles, which will be included automatically, so LAT_NUM = 5, for 
%    instance, will result in points along 7 lines of latitude.
%
%    Output, integer POINT_NUM, the number of grid points.
%
  point_num = 2 + lat_num * long_num;

  return
end
