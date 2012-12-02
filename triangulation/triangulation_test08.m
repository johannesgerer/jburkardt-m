function triangulation_test08 ( )

%*****************************************************************************80
%
%% TEST08 tests R8TRIS2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 June 2005
%
%  Author:
%
%    John Burkardt
%
  node_num = 9;
  dim_num = 2;

  node_xy = [ ...
       0.0, 0.0; ...
       0.0, 1.0; ...
       0.2, 0.5; ...
       0.3, 0.6; ...
       0.4, 0.5; ...
       0.6, 0.4; ...
       0.6, 0.5; ...
       1.0, 0.0; ...
       1.0, 1.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST08\n' );
  fprintf ( 1, '  R8TRIS2 computes the Delaunay triangulation of\n' );
  fprintf ( 1, '    a set of nodes in 2D.\n' );
%
%  Set up the Delaunay triangulation.
%
  [ triangle_num, triangle_node, triangle_neighbor ] = r8tris2 ( ...
    node_num, node_xy );

  triangulation_order3_print ( node_num, triangle_num, node_xy, ...
    triangle_node, triangle_neighbor );

  return
end
