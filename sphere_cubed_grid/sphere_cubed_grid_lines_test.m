function sphere_cubed_grid_lines_test ( )

%*****************************************************************************80
%
%% SPHERE_CUBED_GRID_LINES_TEST tests SPHERE_CUBED_GRID_LINES.
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
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_CUBED_GRID_LINES_TEST\n' );
  fprintf ( 1, '  SPHERE_CUBED_GRID_LINES defines the lines\n' );
  fprintf ( 1, '  on a cubed sphere grid.\n' );
  fprintf ( 1, '  Each cube face is divided into %dx%d subfaces\n', n, n  );

  point_num = sphere_cubed_grid_point_count ( n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of points is %d\n', point_num );

  xyz = sphere_cubed_grid_points ( n, point_num );

  line_num = sphere_cubed_grid_line_count ( n );

  fprintf ( 1, '  The number of grid lines is %d\n', line_num );

  line_data = sphere_cubed_grid_lines ( n, line_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Line     Start              End\n' );
  fprintf ( 1, '  Index    X    Y   Z         X  Y   Z\n' );
  fprintf ( 1, '\n' );

  for i = 1 : min ( 10, line_num )
    fprintf ( 1, '\n' )
    fprintf ( 1, '  %4d  %10f  %10f  %10f    %10f  %10f  %10f\n', ...
      i, line_data(i,1:3,1), line_data(i,1:3,2) );
  end

  return
end
