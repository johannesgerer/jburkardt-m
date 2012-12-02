function ellipse_grid_test01 ( )

%*****************************************************************************80
%
%% ELLIPSE_GRID_TEST01 tests ELLIPSE_GRID.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 September 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01:\n' );
  fprintf ( 1, '  ELLIPSE_GRID can define a grid of points\n' );
  fprintf ( 1, '  with N+1 points on the minor half axis,\n' );
  fprintf ( 1, '  based on any ellipse.\n' );

  n = 8;
  r = [ 2.0, 1.0 ];
  c = [ 1.0, 2.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, '  We use N = %d\n', n );
  fprintf ( 1, '  Radius R = (%f,%f)\n', r(1:2) );
  fprintf ( 1, '  Center C = (%f,%f)\n', c(1:2) );

  ng = ellipse_grid_count ( n, r, c );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of grid points will be %d\n', ng );

  xy = ellipse_grid ( n, r, c, ng );

  r82vec_print_part ( ng, xy, 20, '  Part of the grid point array:' );

  filename = 'ellipse_grid_test01.xy';

  r8mat_write ( filename, 2, ng, xy );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data written to the file "%s".\n', filename );

  return
end
