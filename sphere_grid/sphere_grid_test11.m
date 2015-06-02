function sphere_grid_test11 ( )

%*****************************************************************************80
%
%% SPHERE_GRID_TEST11 tests SPHERE_LL_LINES and SPHERE_LL_POINTS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 October 2012
%
%  Author:
%
%    John Burkardt
%
  lat_num = 22;
  long_num = 24;
  pc(1:3,1) = [ 0.0; 0.0; 0.0 ];
  r = 10.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_GRID_TEST11\n' );
  fprintf ( 1, '  SPHERE_LL_POINTS computes points on a\n' );
  fprintf ( 1, '  latitude/longitude grid\n' );
  fprintf ( 1, '  SPHERE_LL_LINES computes lines on a\n' );
  fprintf ( 1, '  latitude/longitude grid\n' );
  fprintf ( 1, '  Use this information to draw a globe with a grid.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of latitudes is  %d\n', lat_num );
  fprintf ( 1, '  Number of longitudes is %d\n', long_num );
%
%  Get points.
%
  node_num = sphere_ll_point_num ( lat_num, long_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of grid points is %d\n', node_num );

  node_xyz = sphere_ll_points ( r, pc, lat_num, long_num, node_num );
%
%  Get lines.
%
  line_num = sphere_ll_line_num ( lat_num, long_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of line segments is %d\n', line_num );

  line_data = sphere_ll_lines ( lat_num, long_num, line_num );
%
%  Get the scale.
%
  xyz_min(1) = min ( node_xyz(1,:) );
  xyz_max(1) = max ( node_xyz(1,:) );

  xyz_min(2) = min ( node_xyz(2,:) );
  xyz_max(2) = max ( node_xyz(2,:) );

  xyz_min(3) = min ( node_xyz(3,:) );
  xyz_max(3) = max ( node_xyz(3,:) );

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
%  Draw just the points.
%
  figure ( )
  clf
  hold on
  point_size = 50;
  point_color = [ 0.0, 1.0, 0.0 ];
  scatter3 ( node_xyz(1,:), node_xyz(2,:), node_xyz(3,:), point_size, 'k', 'filled' );
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
  view ( 3 )
  hold off

  filename = 'sphere_ll_points.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saving plot as "%s".\n', filename );
%
%  Draw the grid (points and lines)
%  As usual, trying to get Matlab's graphics routines to cooperate is
%  a nightmare.
%
  clf
  hold on
  point_size = 50;
  point_color = [ 0.0, 1.0, 0.0 ];
  scatter3 ( node_xyz(1,:), node_xyz(2,:), node_xyz(3,:), point_size, 'k', 'filled' );

  for i = 1 : line_num
    p = [ line_data(1,i), line_data(2,i) ];
    line ( node_xyz(1,p), node_xyz(2,p), node_xyz(3,p), 'LineWidth', 2 );
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
  view ( 3 )
  hold off

  filename = 'sphere_ll_grid.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saving plot as "%s".\n', filename );
 
  return
end
