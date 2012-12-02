function hex_grid_angle_test01 ( )

%*****************************************************************************80
%
%% TEST01 tests HEX_GRID_ANGLE_01_SIZE.
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
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  HEX_GRID_ANGLE_01_SIZE computes the number of\n' );
  fprintf ( 1, '  points in a hexagonal grid in the unit square,\n' );
  fprintf ( 1, '  with grid lines at a given angle ANGLE,\n' );
  fprintf ( 1, '  with a given spacing H between points on a grid line,\n' );
  fprintf ( 1, '  with the coordinates of the center at CENTER.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        CENTER           ANGLE       H         N\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 3

    [ center(1), seed ] = r8_uniform_01 ( seed );
    [ center(2), seed ] = r8_uniform_01 ( seed );

    angle = 45.0;
    h = 0.25;

    n = hex_grid_angle_01_size ( center, angle, h );

    fprintf ( 1, '  %8f  %8f  %8f  %10f  %6d\n', ...
      center(1:dim_num), angle, h, n );

  end

  fprintf ( 1, '\n' );

  for i = 1 : 3

    center(1:dim_num) = 0.5;
    angle = 45.0;
    h = 0.25 / i;

    n = hex_grid_angle_01_size ( center, angle, h );

    fprintf ( 1, '  %8f  %8f  %8f  %10f  %6d\n', ...
      center(1:dim_num), angle, h, n );

  end

  fprintf ( 1, '\n' );

  for i = 1 : 4

    center(1:dim_num) = 0.5;
    [ t, seed ] = r8_uniform_01 ( seed );
    angle = 180.0 * t;
    h = 0.25;

    n = hex_grid_angle_01_size ( center, angle, h );

    fprintf ( 1, '  %8f  %8f  %8f  %10f  %6d\n', ...
      center(1:dim_num), angle, h, n );

  end

  return
end
