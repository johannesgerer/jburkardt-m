function ply_to_tri_surface_test01 ( ply_filename )

%*****************************************************************************80
%
%% TEST01 tests PLY_TO_TRI_SURFACE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 March 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  PLY_TO_TRI_SURFACE reads a PLY file.\n' );
  fprintf ( 1, '  It can return a PLY data structure,\n' );
  fprintf ( 1, '  or a pair ( NODE_XYZ, TRIANGLE_NODE )\n' );
  fprintf ( 1, '  which is a simple triangular mesh.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Extract nodes and triangles from "%s"\n', ply_filename );

  [ node_xyz, triangle_node ] = ply_to_tri_surface ( ply_filename );
%
%  Print (some of) the data.
%
   node_num = size ( node_xyz, 2 );

   r8mat_transpose_print_some ( 3, node_num, node_xyz, ...
     1, 1, 3, 5, '  The first 5 nodes:' );

   triangle_num = size ( triangle_node, 2 );

   i4mat_transpose_print_some ( 3, triangle_num, triangle_node, ...
     1, 1, 3, 5, '  The first 5 triangles.' );
%
%  View the triangular mesh
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Display the TRI_SURFACE data:\n' );

  trisurf ( triangle_node', node_xyz(1,:), node_xyz(2,:), node_xyz(3,:) );
  axis equal;

  return
end
