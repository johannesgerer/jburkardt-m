function tetrahedron_grid_test01 ( )

%*****************************************************************************80
%
%% TETRAHEDRON_GRID_TEST01 tests TETRAHEDRON_GRID.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 November 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01:\n' );
  fprintf ( 1, '  TETRAHEDRON_GRID can define a tetrahedral grid\n' );
  fprintf ( 1, '  with N+1 points on a side, based on any tetrahedron.\n' );

  n = 10;
  fprintf ( 1, '  N = %d\n', n );

  ng = tetrahedron_grid_count ( n );

  t = [ ...
    0.0, 0.0, 0.0; ...
    1.0, 0.0, 0.0; ...
    0.0, 1.0, 0.0; ...
    0.0, 0.0, 1.0 ]';

  r8mat_print ( 3, 4, t, '  Defining tetrahedron:' );

  tg = tetrahedron_grid ( n, t, ng );

  r83vec_print_part ( ng, tg, 20, '  Part of the grid point array:' );

  filename = 'tetrahedron_grid_test01.xyz';

  r8mat_write ( filename, 3, ng, tg );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data written to the file "%s".\n', filename );

  return
end
