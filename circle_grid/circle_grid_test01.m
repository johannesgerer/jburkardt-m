function circle_grid_test01 ( )

%*****************************************************************************80
%
%% CIRCLE_GRID_TEST01 tests CIRCLE_GRID.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 November 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01:\n' );
  fprintf ( 1, '  CIRCLE_GRID can define a grid of points\n' );
  fprintf ( 1, '  with N+1 points on a horizontal or vertical radius,\n' );
  fprintf ( 1, '  based on any circle.\n' );

  n = 20;
  r = 2.0;
  c = [ 1.0, 5.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, '  We use N = %d\n', n );
  fprintf ( 1, '  Radius R = %f\n', r );
  fprintf ( 1, '  Center C = (%f,%f)\n', c(1), c(2) );

  ng = circle_grid_count ( n, r, c );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of grid points will be %d\n', ng );

  cg = circle_grid ( n, r, c, ng );

  r82vec_print_part ( ng, cg, 20, '  Part of the grid point array:' );

  filename = 'circle_grid_test01.xy';

  r8mat_write ( filename, 2, ng, cg );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data written to the file "%s".\n', filename );

  return
end
