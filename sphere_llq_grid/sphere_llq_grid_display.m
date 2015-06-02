function sphere_llq_grid_display ( r, pc, lat_num, long_num, node_num, node_xyz, ...
    line_num, line_data, filename )

%*****************************************************************************80
%
%% SPHERE_LLQ_GRID_DISPLAY displays points and lines of an LLQ grid on a sphere.
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
%    Input, real R, the radius of the sphere.
%
%    Input, real PC(1,3), the center of the sphere.
%
%    Input, integer LAT_NUM, LONG_NUM, the number of latitude and longitude
%    lines to draw.  The latitudes do not include the North and South
%    poles, which will be included automatically, so LAT_NUM = 5, for instance,
%    will result in points along 7 lines of latitude.
%
%    Input, integer NODE_NUM, the number of grid points.
%
%    Input, real NODE_XYZ(NODE_NUM,3), the grid points.
%
%    Input, integer LINE_NUM, the number of grid lines.
%
%    Input, integer LINE_DATA(LINE_NUM,2), contains pairs of point indices for
%    line segments that make up the grid.
%
%    Input, string FILENAME, the name of a file in which to store a copy of the plot.
%

%
%  Get the scale.
%
  xyz_min(1) = min ( node_xyz(:,1) );
  xyz_max(1) = max ( node_xyz(:,1) );

  xyz_min(2) = min ( node_xyz(:,2) );
  xyz_max(2) = max ( node_xyz(:,2) );

  xyz_min(3) = min ( node_xyz(:,3) );
  xyz_max(3) = max ( node_xyz(:,3) );

  xyz_range(1:3) = xyz_max(1:3) - xyz_min(1:3);

  margin = 0.025 * max ( xyz_range(1), ...
                   max ( xyz_range(2), xyz_range(3) ) );

  x_min = xyz_min(1) - margin;
  x_max = xyz_max(1) + margin;
  y_min = xyz_min(2) - margin;
  y_max = xyz_max(2) + margin;
  z_min = xyz_min(3) - margin;
  z_max = xyz_max(3) + margin;
%
%  Draw the picture.
%
  figure ( )
  clf
  hold on
  point_size = 50;
  point_color = [ 0.0, 1.0, 0.0 ];
  scatter3 ( node_xyz(:,1), node_xyz(:,2), node_xyz(:,3), point_size, 'k', 'filled' );

  for i = 1 : line_num
    p = [ line_data(i,1), line_data(i,2) ];
    line ( node_xyz(p,1), node_xyz(p,2), node_xyz(p,3), 'LineWidth', 2 );
  end
%
%  We want to include a sphere in the picture.  But if the sphere is close to
%  the correct radius, lines that should lie on the surface because they are
%  curved will actually tunnel through the surface because we draw them straight.
%
  [ x, y, z ] = sphere ( 40 );
  x = 0.95 * r * x;
  y = 0.95 * r * y;
  z = 0.95 * r * z;

  c = z ./ z;
  surf ( x, y, z, c, 'EdgeColor', 'None' );

  axis equal
  grid on
  xlabel ( '--X axis--' )
  ylabel ( '--Y axis--' )
  zlabel ( '--Z axis--' )
  title ( filename, 'FontSize', 24 )
  view ( 3 )
  hold off

  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saving plot as "%s".\n', filename );
 
  return
end
