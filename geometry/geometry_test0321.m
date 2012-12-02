function geometry_test0321 ( )

%*****************************************************************************80
%
%% TEST0321 tests HEXAGON_VERTICES_2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  dim_num = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0321\n' );
  fprintf ( 1, '  HEXAGON_VERTICES_2D: the vertices of the unit hexagon.\n' );

  p = hexagon_vertices_2d ( );

  r8mat_transpose_print ( dim_num, 6, p, '  Vertices:' );

  return
end
