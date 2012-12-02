function hex_grid_angle_test05 ( )

%*****************************************************************************80
%
%% TEST05 tests HEX_GRID_ANGLE.
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

  box = [ ...
    10.0, 2.0;
    12.0, 2.5 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST05\n' );
  fprintf ( 1, '  HEX_GRID_ANGLE computes the\n' );
  fprintf ( 1, '  points in a hexagonal grid in the unit square,\n' );
  fprintf ( 1, '  with grid lines at a given angle ANGLE,\n' );
  fprintf ( 1, '  with a given spacing H between points on a grid line,\n' );
  fprintf ( 1, '  with the coordinates of the center at CENTER.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '        CENTER           ANGLE       H         N\n' );
  fprintf ( 1, '\n' );

  center(1:dim_num) = 0.5 * ( box(1:dim_num,1) +  box(1:dim_num,2) );
  angle = 45.0;
  h = 0.25;

  n = hex_grid_angle_size ( box, center, angle, h );

  fprintf ( 1, '  %8f  %8f  %8f  %10f  %6d\n', ...
    center(1:dim_num), angle, h, n );

  r = hex_grid_angle ( box, center, angle, h, n );

  r8mat_transpose_print ( dim_num, n, r, '  Grid points:' );

  return
end
