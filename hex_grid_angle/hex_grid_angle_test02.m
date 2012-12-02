function hex_grid_angle_test02 ( )

%*****************************************************************************80
%
%% TEST02 tests HEX_GRID_ANGLE_01.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 October 2006
%
%  Author:
%
%    John Burkardt
%
  dim_num = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  HEX_GRID_ANGLE_01 computes the\n' );
  fprintf ( 1, '  points in a hexagonal grid in the unit square,\n' );
  fprintf ( 1, '  with grid lines at a given angle ANGLE,\n' );
  fprintf ( 1, '  with a given spacing H between points on a grid line,\n' );
  fprintf ( 1, '  with the coordinates of the center at CENTER.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '        CENTER           ANGLE       H         N\n' );
  fprintf ( 1, '\n' );

  center(1) = 0.5;
  center(2) = 0.0;
  angle = 45.0;
  h = 0.25;

  n = hex_grid_angle_01_size ( center, angle, h );

  fprintf ( 1, '  %8f  %8f  %8f  %10f  %6d\n', ...
    center(1:dim_num), angle, h, n );

  r = hex_grid_angle_01 ( center, angle, h, n );

  r8mat_transpose_print ( dim_num, n, r, '  Grid points:' );

  return
end
