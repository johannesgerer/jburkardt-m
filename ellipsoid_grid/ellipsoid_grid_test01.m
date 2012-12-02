function ellipsoid_grid_test01 ( )

%*****************************************************************************80
%
%% ELLIPSOID_GRID_TEST01 tests ELLIPSOID_GRID.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 September 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01:\n' );
  fprintf ( 1, '  ELLIPSOID_GRID can define a grid of points\n' );
  fprintf ( 1, '  with N+1 points on the minor half axis,\n' );
  fprintf ( 1, '  based on any ellipsoid.\n' );

  n = 4;
  r = [ 2.0, 1.0, 1.5 ];
  c = [ 1.0, 2.0, 1.5 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, '  We use N = %d\n', n );
  fprintf ( 1, '  Radius R = (%f,%f,%f)\n', r(1:3) );
  fprintf ( 1, '  Center C = (%f,%f,%f)\n', c(1:3) );

  ng = ellipsoid_grid_count ( n, r, c );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of grid points will be %d\n', ng );

  xyz = ellipsoid_grid ( n, r, c, ng );

  r83vec_print_part ( ng, xyz, 20, '  Part of the grid point array:' );

  filename = 'ellipsoid_grid_test01.xyz';

  r8mat_write ( filename, 3, ng, xyz );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data written to the file "%s".\n', filename );

  return
end
