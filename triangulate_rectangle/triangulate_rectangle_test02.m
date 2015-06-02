function triangulate_rectangle_test02 ( )

%*****************************************************************************80
%
%% TRIANGULATE_RECTANGLE_TEST02 generates a mesh with 1-based indexing.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 March 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGULATE_RECTANGLE_TEST02\n' );
  fprintf ( 1, '  Generate a triangular mesh for a rectangle.\n' );

  fprintf ( 1, '\n' );

  xl = 1.0;
  xr = 4.0;
  xn = 6;

  fprintf ( 1, '  %g <= X <= %g, using %d intervals.\n', xl, xr, xn );

  yb = 2.0;
  yt = 4.0;
  yn = 2;

  fprintf ( 1, '  %g <= Y <= %g, using %d intervals.\n', yb, yt, yn );

  base = 1;
  fprintf ( 1, '  Element indexing base = %d\n', base );

  xyn = ( xn + 1 ) * ( yn + 1 );
  fprintf ( 1, '  Total number of nodes will be %d\n', xyn );

  en = 2 * xn * yn;
  fprintf ( 1, '  Total number of elements will be %d\n', en );
%
%  Compute the grid.
%
  [ xy, elem ] = triangulate_rectangle ( xl, xr, xn, yb, yt, yn, base );
%
%  Print the grid.
%
  r8mat_transpose_print ( 2, xyn, xy, '  Nodes:' )

  i4mat_transpose_print ( 3, en, elem, '  Elements:' )
%
%  Write the grids to files.
%
  node_filename = 'test02_nodes.txt';
  r8mat_write ( node_filename, 2, xyn, xy );

  element_filename = 'test02_elements.txt';
  i4mat_write ( element_filename, 3, en, elem );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Nodes written to file "%s"\n', node_filename );
  fprintf ( 1, '  Elements written to file "%s"\n', element_filename );

  return
end
