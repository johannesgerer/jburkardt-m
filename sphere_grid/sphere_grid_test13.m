function sphere_grid_test13 ( )

%*****************************************************************************80
%
%% SPHERE_GRID_TEST13 tests SPHERE_CUBED_LINES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 October 2012
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_GRID_TEST13\n' );
  fprintf ( 1, '  SPHERE_CUBED_LINES produces cubed sphere grid lines.\n' );
  fprintf ( 1, '  Each cube face is divided into %dx%d subfaces\n', n, n  );

  point_num = sphere_cubed_point_num ( n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of points is %d\n', point_num );

  xyz = sphere_cubed_points ( n, point_num );

  line_num = sphere_cubed_line_num ( n );

  fprintf ( 1, '  The number of grid lines is %d\n', line_num );

  line_data = sphere_cubed_lines ( n, line_num );

  if ( 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '     L          X1          Y1          Z1            X2          Y2          Z2\n' );
    fprintf ( 1, '\n' );

    for l = 1 : line_num
      fprintf ( '  %4d  %10.4f  %10.4f  %10.4f    %10.4f  %10.4f  %10.4f\n', ...
        l, line_data(1:3,1,l), line_data(1:3,2,l) );
    end
  end
%
%  Get the scale.
%
  xyz_min(1) = min ( xyz(1,:) );
  xyz_max(1) = max ( xyz(1,:) );

  xyz_min(2) = min ( xyz(2,:) );
  xyz_max(2) = max ( xyz(2,:) );

  xyz_min(3) = min ( xyz(3,:) );
  xyz_max(3) = max ( xyz(3,:) );

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
%  As usual, trying to get Matlab's graphics routines to cooperate is
%  a nightmare.
%
  clf
  hold on
  point_size = 50;
  point_color = [ 0.0, 1.0, 0.0 ];
  scatter3 ( xyz(1,:), xyz(2,:), xyz(3,:), point_size, 'k', 'filled' );

  for i = 1 : line_num
    xx = [ line_data(1,1,i); line_data(1,2,i) ];
    yy = [ line_data(2,1,i); line_data(2,2,i) ];
    zz = [ line_data(3,1,i); line_data(3,2,i) ];
    line ( xx, yy, zz, 'LineWidth', 2 );
  end
%
%  We want to include a sphere in the picture.  But if the sphere is close to
%  the correct radius, lines that should lie on the surface because they are
%  curved will actually tunnel through the surface because we draw them straight.
%
  [ x, y, z ] = sphere ( 40 );
  x = 0.95 * x;
  y = 0.95 * y;
  z = 0.95 * z;

  c = z ./ z;
  surf ( x, y, z, c, 'EdgeColor', 'None' );

  axis equal
  grid on
  xlabel ( '--X axis--' )
  ylabel ( '--Y axis--' )
  zlabel ( '--Z axis--' )
  view ( 3 )
  hold off

  filename = 'sphere_cubed_grid.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saving plot as "%s".\n', filename );
 
  return
end
