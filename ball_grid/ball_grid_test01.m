function ball_grid_test01 ( )

%*****************************************************************************80
%
%% BALL_GRID_TEST01 tests BALL_GRID.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01:\n' );
  fprintf ( 1, '  BALL_GRID can define a grid of points\n' );
  fprintf ( 1, '  with N+1 points on a horizontal or vertical radius,\n' );
  fprintf ( 1, '  based on any ball.\n' );

  n = 10;
  r = 2.0;
  c = [ 1.0, 5.0, 2.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, '  We use N = %d\n', n );
  fprintf ( 1, '  Radius R = %f\n', r );
  fprintf ( 1, '  Center C = (%f,%f,%f)\n', c(1:3) );

  ng = ball_grid_count ( n, r, c );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of grid points will be %d\n', ng );

  bg = ball_grid ( n, r, c, ng );

  r83vec_print_part ( ng, bg, 20, '  Part of the grid point array:' );

  filename = 'ball_grid_test01.xyz';

  r8mat_write ( filename, 3, ng, bg );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data written to the file "%s".\n', filename );

  return
end
