function ply_io_test01 ( )

%*****************************************************************************80
%
%% TEST01 tests TRI_MESH_TO_PLY and PLY_WRITE.
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
  fprintf ( 1, '  TRI_MESH_TO_PLY converts a pair of arrays\n' );
  fprintf ( 1, '  describing a triangular mesh into a data\n' );
  fprintf ( 1, '  structure suitable for a PLY file.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  PLY_WRITE writes PLY data to a file.\n' );
%
%  Define the surface of a pyramid:
%
  node_xyz = [ 0,0,0; 1,0,0; 1,1,0; 0,1,0; 0.5,0.5,1.6 ]';
  triangle_node = [ 2,1,4; 2,4,3; 1,2,5; 1,5,4; 4,5,3; 2,3,5 ]';
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
%  View the pyramid.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Display the TRI_MESH data:\n' );

  trisurf ( triangle_node', node_xyz(1,:), node_xyz(2,:), node_xyz(3,:) );
  axis equal;
%
%  The data can be converted to PLY format, and written to a PLY file:
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Convert the TRI_MESH data to PLY data.\n' );

  ply_data = tri_mesh_to_ply ( node_xyz, triangle_node );

  ply_file = 'pyramid.ply';

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Write the PLY data to the file "%s".\n', ply_file );

  ply_write ( ply_data, ply_file, 'ascii' );

  return
end
