function sphere_cubed_grid_lines_display ( point_num, xyz, line_num, ...
  line_data, filename )

%*****************************************************************************80
%
%% SPHERE_CUBED_GRID_LINES_DISPLAY displays the lines on a cubed sphere grid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 May 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer LINE_NUM, the number of lines.
%
%    Input, real LINE_DATA(LINE_NUM,3,2), for each line I, the X/Y/Z 
%    coordinates of the start and end of a line segment on the grid.
%
%    Input, string FILENAME, the name of the file into which a copy of the
%    graphics information should be stored.

%
%  Get the scale.
%
  for i = 1 : 3
    xyz_min(i) = min ( min ( line_data(:,i,:) ) );
    xyz_max(i) = max ( max ( line_data(:,i,:) ) );
  end

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
  figure ( )
  clf
  hold on
  point_size = 50;
  point_color = [ 0.0, 1.0, 0.0 ];
  scatter3 ( xyz(:,1), xyz(:,2), xyz(:,3), point_size, 'k', 'filled' );

  for i = 1 : line_num
    xx = [ line_data(i,1,1); line_data(i,1,2) ];
    yy = [ line_data(i,2,1); line_data(i,2,2) ];
    zz = [ line_data(i,3,1); line_data(i,3,2) ];
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
  title ( 'Sphere cubed grid' );
  view ( 3 )
  hold off

  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saving plot as "%s".\n', filename );
 
  return
end